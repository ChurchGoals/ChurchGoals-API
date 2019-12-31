defmodule CG.Schemas.UserSchema do
  @moduledoc """
  User Schema.
  Schemas are used to interact with the database via changesets and ecto schemas.
  """

  use CG.Web, :schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field :active, :boolean, default: true
    field :locked, :boolean, default: false

    field :email
    field :password, :string, virtual: true
    field :password_hash

    field :reset_code, :string
    field :reset_requested_at, :utc_datetime
    field :reset_attempts, :integer, default: 0

    field :last_login, :utc_datetime
    field :login_attempts, :integer, default: 0

    field :person_id, :binary_id

    timestamps()
  end

  ###
  ### CHANGESETS
  ###

  def create_changeset(user, params \\ %{}) do
    user 
    |> cast(params, [:email, :person_id])
    |> validate_required([:email, :person_id])
    |> unique_constraint(:email)
    |> unique_constraint(:person_id)
  end
end