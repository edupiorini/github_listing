defmodule GithubListing.Repo do
  use Ecto.Repo,
    otp_app: :github_listing,
    adapter: Ecto.Adapters.Postgres
end
