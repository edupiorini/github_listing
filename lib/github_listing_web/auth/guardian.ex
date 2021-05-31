defmodule GithubListingWeb.Auth.Guardian do
  use Guardian, otp_app: :github_listing

  alias GithubListing.User

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> GithubListing.get_user()
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- GithubListing.get_user(user_id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please, verify your credentials")}
      error -> error
    end
  end
end
