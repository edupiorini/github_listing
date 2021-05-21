defmodule GithubListing.GithubApi.Client do
  @moduledoc """
  Client makes the connection between Github API and the application.
  """

  use Tesla

  alias GithubListing.Error
  alias GithubListing.GithubApi.Parser

  plug Tesla.Middleware.BaseUrl, "https://api.github.com/users/"
  plug Tesla.Middleware.Headers, [{"user-agent", "GithubListing"}]
  plug Tesla.Middleware.JSON

  @spec get_user(String.t()) :: {:ok, {[map()]}}
  def get_user(username) do
    "#{username}/repos"
    |> get()
    |> handle_get()
  end

  # Success case
  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}) do
    body
    |> Parser.parse_info()
  end

  # Not Found

  defp handle_get({:ok, %Tesla.Env{status: 404}}),
    do: {:error, Error.build(:not_found, "Repo not found")}

  defp handle_get({:ok, %Tesla.Env{status: 403}}),
    do: {:error, Error.build(:forbidden, "Forbidden! No User Agent sent on header")}
end
