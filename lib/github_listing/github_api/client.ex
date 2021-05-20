defmodule GithubListing.GithubApi.Client do
  @moduledoc """
  Client makes the connection between Github API and the application.
  """

  use Tesla

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

  # defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, "Not Found"}
end
