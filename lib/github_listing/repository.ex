defmodule GithubListing.Repository do
  @moduledoc """
  Repository struct
  """
  @keys [:name, :description, :stargazers_count, :html_url]

  @enforce_keys @keys

  @derive {Jason.Encoder, only: @keys}

  defstruct @keys

  def build(name, description, stargazers_count, html_url) do
    {:ok,
     %__MODULE__{
       name: name,
       description: description,
       stargazers_count: stargazers_count,
       html_url: html_url
     }}
  end

  def build(%{
        "name" => name,
        "description" => description,
        "stargazers_count" => stargazers_count,
        "html_url" => html_url
      }),
      do: build(name, description, stargazers_count, html_url)

  def build(_params), do: {:error, "Invalid Params"}
end
