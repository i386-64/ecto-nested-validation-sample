# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :fiona,
  ecto_repos: [Fiona.Repo]

# Configures the endpoint
config :fiona, FionaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5yc3b1wprh5DOK0f48F7pR4usTYKoQvjLgENl3WVeBGY2vD/OqXAGRW/lDKq6zyp",
  render_errors: [view: FionaWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Fiona.PubSub,
  live_view: [signing_salt: "yRUVxZmV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
