defmodule GithubListing.GithubApi.Client do
  @moduledoc """
  Client makes the connection between Github API and the application.
  """

  use Tesla

  alias GithubListing.Error
  alias GithubListing.Repository

  plug Tesla.Middleware.BaseUrl, "https://api.github.com/users/"
  plug Tesla.Middleware.Headers, [{"user-agent", "GithubListing"}]
  plug Tesla.Middleware.JSON

  def get_repo_list(username) do
    "#{username}/repos"
    |> get()
    |> handle_get()
  end

  # Success case
  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}) do
    with repo_list <- Enum.map(body, fn x -> map_repo(x) end), do: {:ok, repo_list}
  end

  # Not Found

  defp handle_get({:ok, %Tesla.Env{status: 404}}),
    do: {:error, Error.build(:not_found, "Repo not found")}

  defp handle_get({:ok, %Tesla.Env{status: 403}}),
    do: {:error, Error.build(:forbidden, "Forbidden! No User Agent sent on header")}

  defp map_repo(repo) do
    with {:ok, repo} <- Repository.build(repo), do: repo
  end
end
