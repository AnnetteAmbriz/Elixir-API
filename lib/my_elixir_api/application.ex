defmodule MyElixirApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MyElixirApiWeb.Telemetry,
      # Start the Ecto repository
      MyElixirApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MyElixirApi.PubSub},
      # Start the Endpoint (http/https)
      MyElixirApiWeb.Endpoint
      # Start a worker by calling: MyElixirApi.Worker.start_link(arg)
      # {MyElixirApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyElixirApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyElixirApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
