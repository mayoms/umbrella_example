defmodule InternalAPI.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy,
       [scheme: :http, plug: InternalAPI.Router, port: 8888, ref: InternalAPI.Router]}
    ]

    Logger.info("Starting #{__MODULE__} with children: #{inspect(children)}")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InternalAPI.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
