# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :opencivics,
  ecto_repos: [Opencivics.Repo]

# Configures the endpoint
config :opencivics, Opencivics.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jtp7g5LyPGdRRP/829SkXirSohAr7z4TzlHW2ImfDF75NYU0+GyL+zVVfDLyWmyn",
  render_errors: [view: Opencivics.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Opencivics.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
