use Mix.Config

config :ex_playground, ExPlayground.Endpoint,
  url: [host: System.get_env("APP_HOST")],
  http: [port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true

config :ex_playground,
  ga_tracking_id: System.get_env("GA_TRACKING_ID")

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section:
#
#  config :ex_playground, ExPlayground.Endpoint,
#    ...
#    https: [port: 443,
#            keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#            certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

# Do not pring debug messages in production
config :logger, level: :info

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :ex_playground, ExPlayground.Endpoint, server: true
#

# Configure your database
config :ex_playground, ExPlayground.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20
