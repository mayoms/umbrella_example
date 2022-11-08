defmodule Storage.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  require Logger

  use Application

  @impl true
  def start(_type, _args) do
    children =
      [
        # Starts a worker by calling: Storage.Worker.start_link(arg)
        # {Storage.Worker, arg}
        Storage.Repo
      ]
      |> IO.inspect()

    :ok =
      :telemetry.attach(
        "repo-telemetry-handler",
        [:storage, :repo, :query],
        &Util.Telemetry.handle_event/4,
        %{}
      )

    Logger.info("Starting #{__MODULE__} with children: #{inspect(children)}")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Storage.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
