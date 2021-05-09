defmodule Fiona.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Fiona.Repo,
      # Start the Endpoint (http/https)
      FionaWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Fiona.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    FionaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
