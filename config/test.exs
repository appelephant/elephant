import Config

config :elephant, Elephant.Repo,
  username: "elephant",
  password: "elephant",
  hostname: "localhost",
  database: "elephant_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elephant, ElephantWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "4KpLrh6Ga++F5ddWiAktGRrj7xD7fLa8TyPN1kMZ9DioMILl7gUE4fuuQhFDGNVA",
  server: false

# In test we don't send emails.
config :elephant, Elephant.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
