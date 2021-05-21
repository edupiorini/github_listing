defmodule GithubListingWeb.ClientController do
  use GithubListingWeb, :controller

  def index(conn, %{"username" => username}) do
    with {:ok, repo} <- GithubListing.list_repository(username) do
      conn
      |> put_status(:ok)
      |> render("repository.json", repo: repo)
    end
  end
end
