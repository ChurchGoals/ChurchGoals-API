defmodule CG.Repo.Migrations.Users do
  use Ecto.Migration

  def up do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :active, :boolean, default: true
      add :locked, :boolean, default: false

      add :email, :string, null: false
      add :password_hash, :string
      add :reset_code, :string
      add :reset_requested_at, :utc_datetime
      add :reset_attempts, :integer, default: 0, null: false
      add :last_login, :utc_datetime
      add :login_attempts, :integer, default: 0, null: false
      add :tokens, {:array, :string}, default: []

      add :person_id, :uuid, null: false

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:person_id])
    create index(:users, [:active])

    create table(:people, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :is_youth, :boolean, default: true
      add :is_male, :boolean, default: true
      add :name, :string, null: false
      add :age, :integer

      timestamps()
    end

    create index(:people, [:is_youth])
    create index(:people, [:is_male])
    create index(:people, [:name])
    create index(:people, [:age])

    create table(:families, primary_key: false) do
      add :id, :uuid, primary_key: true

      timestamps()
    end

    create table(:family_members, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :family_id, :uuid, null: false
      add :person_id, :uuid, null: false
      add :type, :string, null: false

      timestamps()
    end

    create index(:family_members, [:family_id])
    create index(:family_members, [:person_id])
    create index(:family_members, [:type])
  end

  def down do
    drop table(:users)
    drop table(:people)
    drop table(:families)
    drop table(:family_members)
  end
end
