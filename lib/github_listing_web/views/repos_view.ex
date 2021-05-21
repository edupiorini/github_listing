defmodule GithubListingWeb.ReposView do
  use GithubListingWeb, :view

  alias GithubListing.Repository

  def render("repositories.json", %{repos: [%Repository{} | _rest] = repos}) do
    %{
      message: "Repositories found!",
      repos: repos
    }
  end
end
