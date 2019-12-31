import Config

# Configure your database
config :cg, CG.Repo,
  username: "postgres",
  password: "postgres",
  database: "cg_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
