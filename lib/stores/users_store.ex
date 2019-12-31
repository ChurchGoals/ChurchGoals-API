defmodule CG.Stores.UsersStore do
  @moduledoc """
  Users Store.
  Stores are used a single point of access for a specific concept.
  User validation should have been done before arriving here.
  """

  alias CG.Repo
  alias CG.Schemas.UserSchema

  def create(params) do
    %UserSchema{}
    |> UserSchema.create_changeset(params)
    |> Repo.insert()
  end

  def get(id) do
    id
    |> Ecto.UUID.cast()
    |> case do
      {:ok, uuid} ->
        UserSchema
        |> Repo.get_by(%{id: uuid})
      :error -> nil
    end
  end
end
