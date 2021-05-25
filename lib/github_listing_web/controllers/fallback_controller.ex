defmodule GithubListingWeb.FallbackController do
  use GithubListingWeb, :controller

  alias GithubListing.Error
  alias GithubListingWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
