defmodule GithubListingWeb.UsersView do
  use GithubListingWeb, :view

  alias GithubListing.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created successfully!",
      token: token,
      user: user
    }
  end

  def render("sign_in.json", %{token: token}), do: %{token: token}
end
