defmodule GithubListing.Users.Create do
  alias Ecto.Changeset
  alias GithubListing.{Error, Repo, User}

  def call(params) do
    changeset = User.changeset(params)

    with %Changeset{} <- User.changeset(params),
         {:ok, %User{}} = user <- Repo.insert(changeset) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end
end
