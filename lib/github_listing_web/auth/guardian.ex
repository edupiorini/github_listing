defmodule GithubListingWeb.Auth.Guardian do
  use Guardian, otp_app: :github_listing

  alias GithubListing.User

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> GithubListing.get_user()
  end
end
