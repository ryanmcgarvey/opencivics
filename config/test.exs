use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :opencivics, Opencivics.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :opencivics, Opencivics.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "opencivics_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :opencivics, Opencivics.Endpoint,
  http: [port: 4001],
  server: true
