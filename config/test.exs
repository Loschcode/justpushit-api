use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :justpushit_api, JustpushitApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :justpushit_api, JustpushitApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "feed",
  password: "feeding",
  database: "feed_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
