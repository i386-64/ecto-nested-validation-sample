defmodule FionaWeb.Router do
  use FionaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FionaWeb do
    pipe_through :api
  end
end
