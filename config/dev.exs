import Config

# Configure your database
config :elephant, Elephant.Repo,
  username: "elephant",
  password: "elephant",
  hostname: "localhost",
  database: "elephant_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :elephant, ElephantWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "CTg0M/zNdvKGbP/z1nUmMvaqdwA7z7YpFS5hbL9O12K6s4GVscSmKzjA1pUfVAoX",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ]

# Watch static and templates for browser reloading.
config :elephant, ElephantWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/elephant_web/(live|views)/.*(ex)$",
      ~r"lib/elephant_web/templates/.*(eex)$"
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime
