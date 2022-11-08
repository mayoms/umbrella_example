defmodule JobRunner.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Oban, Application.fetch_env!(:job_runner, Oban)}
    ]

    Logger.info("Starting #{__MODULE__} with children: #{inspect(children)}")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JobRunner.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
