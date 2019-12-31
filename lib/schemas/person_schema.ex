defmodule CG.Schemas.PersonSchema do
  @moduledoc """
  Person Schema.
  Schemas are used to interact with the database via changesets and ecto schemas.
  """

  use CG.Web, :schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "people" do
    field :name

    timestamps()
  end
end
