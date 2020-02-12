# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :phoenix_ets_playground, PhoenixEtsPlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vs4C4Mulq1nWyVcZyDl/ahaMhYbpRI9nSkujbQkW0IKYbaWnc6B1/pnv5tJ81s1Z",
  render_errors: [view: PhoenixEtsPlaygroundWeb.ErrorView, accepts: ~w(html)]

config :phoenix, :json_library, Poison

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:module, :function]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
