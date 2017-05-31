# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :justpushit_api,
  ecto_repos: [JustpushitApi.Repo]

# Configures the endpoint
config :justpushit_api, JustpushitApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "E9Udd12mRfh9RvsZZuGGfttvgbGCcJYVXeklsaTgHux7Nu9qb4+zomr8VdH91dzy",
  render_errors: [view: JustpushitApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: JustpushitApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures the Authentication system
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "JustpushitApi",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "4deJP8QzEVziW5ZSWDGxnE10dDEWQ2gYxxx19I1mrvnkSQ3DFllCsUcm9jC+3QXM",
  serializer: JustpushitApi.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
