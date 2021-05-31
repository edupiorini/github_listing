defmodule GithubListingWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :github_listing

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
