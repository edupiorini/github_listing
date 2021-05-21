defmodule GithubListingWeb.ClientView do
  use GithubListingWeb, :view

  def render("repository.json", %{repo: [%{} | _rest]} = repo) do
    repo
  end
end
