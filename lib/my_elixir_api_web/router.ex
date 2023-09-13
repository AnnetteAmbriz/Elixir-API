defmodule MyElixirApiWeb.Router do
  use MyElixirApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyElixirApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
