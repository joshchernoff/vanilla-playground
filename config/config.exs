# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :vanilla_playground2,
  ecto_repos: [VanillaPlayground2.Repo],
  generators: [timestamp_type: :utc_datetime, binary_id: true]

# Configures the endpoint
config :vanilla_playground2, VanillaPlayground2Web.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: VanillaPlayground2Web.ErrorHTML, json: VanillaPlayground2Web.ErrorJSON],
    layout: false
  ],
  pubsub_server: VanillaPlayground2.PubSub,
  live_view: [signing_salt: "fgLkJefO"]

# Configure esbuild (the version is required)
# config :esbuild,
#   version: "0.17.11",
#   vanilla_playground2: [
#     args:
#       ~w(js/app.js js/home.js js/sw.js --bundle --splitting --target=esnext --format=esm --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
#     cd: Path.expand("../assets", __DIR__),
#     env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
#   ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"