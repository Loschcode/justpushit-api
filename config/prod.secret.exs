use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :justpushit_api, JustpushitApi.Endpoint,
  secret_key_base: "yyjLBoYJHO8bSUoDrvrSCOzgcZfqvmhLZqtV21HyYMi5vfymJOSdR0mCPRJ/ooP7"

# Configure your database
config :justpushit_api, JustpushitApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "justpushit_api_prod",
  pool_size: 20
