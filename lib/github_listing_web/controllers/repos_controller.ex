defmodule GithubListingWeb.ReposController do
  use GithubListingWeb, :controller

  alias GithubListingWeb.FallbackController

  action_fallback(FallbackController)

  def index(conn, %{"username" => username}) do
    with {:ok, repos} <- GithubListing.list_repositories(username) do
      conn
      |> put_status(:ok)
      |> render("repositories.json", repos: repos)
    end
  end
end
