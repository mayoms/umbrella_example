# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :logger, :console, metadata: [:application, :umbrella_app]

config :storage, ecto_repos: [Storage.Repo]

config :storage, Storage.Repo,
  database: "supervised_deps_repo",
  hostname: "localhost"

config :job_runner, Oban,
  repo: Storage.Repo,
  plugins: [Oban.Plugins.Pruner],
  queues: [default: 10]

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
