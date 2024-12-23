defmodule VanillaPlaygroundWeb.Router do
  use VanillaPlaygroundWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {VanillaPlaygroundWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", VanillaPlaygroundWeb do
    pipe_through :browser
    resources "/posts", PostController, only: [:index, :show]

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", VanillaPlaygroundWeb do
  #   pipe_through :api
  # end
end
