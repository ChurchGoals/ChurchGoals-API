import Config

# Configure your database
config :cg, CG.Repo,
  username: "postgres",
  password: "postgres",
  database: "cg_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
