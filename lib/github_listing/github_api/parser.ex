defmodule GithubListing.GithubApi.Parser do
  @moduledoc """
  Parses the request to a list of informations
  """

  def parse_info(body) do
    result =
      Enum.reduce(body, [], fn info, acc ->
        [
          %{
            "id" => Map.get(info, "id"),
            "name" => Map.get(info, "name"),
            "html_url" => Map.get(info, "html_url"),
            "description" => Map.get(info, "description"),
            "stargazers_count" => Map.get(info, "stargazers_count")
          }
          | acc
        ]
      end)

    {:ok, result}
  end
end
