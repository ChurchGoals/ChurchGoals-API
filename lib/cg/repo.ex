defmodule CG.Repo do
  use Ecto.Repo,
    otp_app: :cg,
    adapter: Ecto.Adapters.Postgres
end
