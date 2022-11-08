defmodule API.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, [scheme: :http, plug: API.Router, port: 8080, ref: API.Router]},
      {Plug.Cowboy, [scheme: :http, plug: API.LegacyRouter, port: 3000, ref: API.LegacyRouter]}
    ]

    Logger.info("Starting #{__MODULE__} with children: #{inspect(children)}")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: API.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
