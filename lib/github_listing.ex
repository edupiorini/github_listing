defmodule GithubListing do
  @moduledoc """
  GithubListing keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias GithubListing.GithubApi.Client

  defdelegate list_repositories(username), to: Client, as: :get_repo_list
end
