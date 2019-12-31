defmodule CG.Router do
  use CG.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CG do
    pipe_through :api
  end
end
