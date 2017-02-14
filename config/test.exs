use Mix.Config

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

config :wallaby, screenshot_on_failure: true
config :wallaby, screenshot_dir: "/tmp/screenshots"


config :opencivics, :sql_sandbox, true
  
