defmodule Elephant.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Elephant.Repo,
      # Start the Telemetry supervisor
      ElephantWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Elephant.PubSub},
      # Start the Endpoint (http/https)
      ElephantWeb.Endpoint
      # Start a worker by calling: Elephant.Worker.start_link(arg)
      # {Elephant.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Elephant.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElephantWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
