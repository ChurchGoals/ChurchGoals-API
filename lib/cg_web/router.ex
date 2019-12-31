defmodule CGWeb.Router do
  use CGWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CGWeb do
    pipe_through :api
  end
end
