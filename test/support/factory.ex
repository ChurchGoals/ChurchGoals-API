defmodule CG.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: CG.Repo
  alias CG.Schemas.{PersonSchema, UserSchema}

  def person_factory do
    %PersonSchema{
      name: sequence(:name, &"Name #{&1}"),
    }
  end

  def user_factory do
    %UserSchema{
      email: sequence(:email, &"test@test#{&1}.com"),
      person_id: insert(:person).id,
    }
  end
end