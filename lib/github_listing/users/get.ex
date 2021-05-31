defmodule GithubListing.Users.Get do
  alias Ecto.UUID
  alias GithubListing.{Error, Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format"}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User not found!")}
      user -> {:ok, user}
    end
  end
end
