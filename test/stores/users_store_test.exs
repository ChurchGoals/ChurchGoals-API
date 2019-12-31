defmodule CG.Stores.OrganizationsStoreTest do
  use CG.DataCase
  alias CG.Stores.{UsersStore}

  test "create user" do
    person = insert(:person)
    {:ok, user} = UsersStore.create(%{ email: "test@test.com", person_id: person.id })
    assert user.email == "test@test.com"
    assert user.person_id == person.id
    assert user.active == true
    assert user.locked == false

    # Can NOT create duplicate
    {:error, %{errors: errors}} = UsersStore.create(%{ email: "test@test.com", person_id: person.id })
    [{:email, error} | _rest] = errors

    assert CG.ErrorHelpers.translate_error(error) == "has already been taken"

    # Can NOT create duplicate
    {:error, %{errors: errors}} = UsersStore.create(%{ email: "test2@test.com", person_id: person.id })
    [{:person_id, error} | _rest] = errors
    assert CG.ErrorHelpers.translate_error(error) == "has already been taken"
  end

  test "get" do
    user = insert(:user)

    assert UsersStore.get(user.id) == user
  end

  test "get invalid id" do
    assert UsersStore.get(-99) == nil
  end
end
