defmodule GismapWeb.Router do
  use GismapWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
  #  plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GismapWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/locations", LocationController, except: [:new, :edit]

  end

  # Other scopes may use custom stacks.
  # scope "/api", GismapWeb do
  #   pipe_through :api
  # end
end
