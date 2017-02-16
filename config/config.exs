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

config :phoenix, :template_engines,
    slim: PhoenixSlime.Engine,
    slime: PhoenixSlime.Engine


config :guardian, Guardian,
      issuer: "MyApp",
      ttl: { 100_000, :days },
      verify_issuer: true,
      secret_key: "EPROIUELKJSDOIUEWORIJWLEKJFSODIojwoeirjsldkfjwoerijowkjflsef",
      serializer: Opencivics.GuardianSerializer,
      # hooks: Opencivics.GuardianHooks,
      permissions: %{
        default: [:read_profile, :write_profile]
      }


# config :ueberauth, Ueberauth,
  # providers: [
    # facebook: { Ueberauth.Strategy.Facebook, [] },
    # github: { Ueberauth.Strategy.Github, [] },
    # google: { Ueberauth.Strategy.Google, [] },
    # identity: { Ueberauth.Strategy.Identity, [
        # callback_methods: ["POST"],
        # uid_field: :username,
        # nickname_field: :username,
      # ] },
    # slack: { Ueberauth.Strategy.Slack, [] },
    # twitter: { Ueberauth.Strategy.Twitter, []}
  # ]

# config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  # client_id: System.get_env("FACEBOOK_APP_ID"),
  # client_secret: System.get_env("FACEBOOK_APP_SECRET"),
  # redirect_uri: System.get_env("FACEBOOK_REDIRECT_URI")

# config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  # client_id: System.get_env("GITHUB_CLIENT_ID"),
  # client_secret: System.get_env("GITHUB_CLIENT_SECRET")

# config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  # client_id: System.get_env("GOOGLE_CLIENT_ID"),
  # client_secret: System.get_env("GOOGLE_CLIENT_SECRET"),
  # redirect_uri: System.get_env("GOOGLE_REDIRECT_URI")

# config :ueberauth, Ueberauth.Strategy.Slack.OAuth,
  # client_id: System.get_env("SLACK_CLIENT_ID"),
  # client_secret: System.get_env("SLACK_CLIENT_SECRET")

# config :ueberauth, Ueberauth.Strategy.Twitter.OAuth,
  # consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
  # consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET")



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
