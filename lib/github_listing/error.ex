defmodule GithubListing.Error do
  @moduledoc """
  This module is a generic error builder
  """
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  @type error_map :: %{
          status: atom(),
          result: String.t()
        }
  @type status :: atom()
  @type result :: String.t()
  @spec build(status, result) :: error_map

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end
end
