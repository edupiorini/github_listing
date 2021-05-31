# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :github_listing,
  ecto_repos: [GithubListing.Repo]

config :github_listing, GithubListingWeb.Auth.Pipeline,
  module: GithubListingWeb.Auth.Guardian,
  error_handler: GithubListingWeb.Auth.ErrorHandler

config :github_listing, GithubListingWeb.Auth.Guardian,
  issuer: "github_listing",
  secret_key: "BZA2fAn8xVSSz6Y8A50pGGB54SOXo4lD2adcSrpDrqVhVpGZPo9tnwiJ3427+K4S"

# Configures the endpoint
config :github_listing, GithubListingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VqFVXFBPpPZeNLlMo2wRn8Rx5n/iiCc6McsMqGkuJdaLNMuFs39CmONXvtcnKYN2",
  render_errors: [view: GithubListingWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GithubListing.PubSub,
  live_view: [signing_salt: "Ny8AtASh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures migrations primary key as UUID
config :github_listing, GithubListing.Repo, migration_primary_key: [type: :binary_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
