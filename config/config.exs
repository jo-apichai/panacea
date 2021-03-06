# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :panacea,
  ecto_repos: [Panacea.Repo]

# Configures the endpoint
config :panacea, PanaceaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n54FXtBAYS0oKc19+YpBgz9SAFrybEaXDez5FsC+z/jVXFy3kpSdXBqZwfigBupp",
  render_errors: [view: PanaceaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Panacea.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian
config :panacea, Panacea.Auth.Guardian,
  issuer: "panacea",
  secret_key: "lqGrxGerAq4GaFmtXm04kPeiO+h+AXlgWc0Kr1HJB7VopJQi8Ej3WJcKn2viIrYK"

config :panacea, Panacea.Auth.Pipeline.Authenticated,
  module: Panacea.Auth.Guardian,
  error_handler: Panacea.Auth.AuthErrorHandler

config :panacea, Panacea.Auth.Pipeline.Unauthenticated,
  module: Panacea.Auth.Guardian,
  error_handler: Panacea.Auth.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
