defmodule Elephant.Repo do
  use Ecto.Repo,
    otp_app: :elephant,
    adapter: Ecto.Adapters.Postgres
end
