defmodule Be2b.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Be2bWeb.Telemetry,
      Be2b.Repo,
      {DNSCluster, query: Application.get_env(:be2b, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Be2b.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Be2b.Finch},
      # Start a worker by calling: Be2b.Worker.start_link(arg)
      # {Be2b.Worker, arg},
      # Start to serve requests, typically the last entry
      Be2bWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Be2b.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Be2bWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
