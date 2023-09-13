# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :my_elixir_api,
  ecto_repos: [MyElixirApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :my_elixir_api, MyElixirApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: MyElixirApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: MyElixirApi.PubSub,
  live_view: [signing_salt: "SI8lTVTW"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Guardian
config :my_elixir_api, MyElixirApiWeb.Guardian,
issuer: "my_elixir_api",
secret_key: "G3Gvy1FrCoAH6WTxeY+XpbvKT0UNdYRidbcnA22VLwwmelukfBTjI8/gQyBknirE"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
