use Mix.Config

config :phoenix_ets_playground, PhoenixEtsPlaygroundWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  check_origin: false

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime
