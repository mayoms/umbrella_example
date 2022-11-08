defmodule Util.Telemetry do
  def handle_event([app_name, :repo, :query], measurements, metadata, config) do
    unless get_in(metadata, [:options, :oban_conf]) do
      IO.inspect(binding())
    end
  end
end
