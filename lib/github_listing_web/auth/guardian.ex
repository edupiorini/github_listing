defmodule GithubListingWeb.Auth.Guardian do
  use Guardian, otp_app: :github_listing

  alias GithubListing.User

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(claims) do
    # Here we'll look up our resource from the claims, the subject can be
    # found in the `"sub"` key. In `above subject_for_token/2` we returned
    # the resource id so here we'll rely on that to look it up.
    claims
    |> Map.get("sub")
    # PRECISAMOS DEFINIR O USERGET PRIMEIRO!
    |> UserGet.call()
  end
end
