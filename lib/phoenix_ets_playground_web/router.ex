defmodule PhoenixEtsPlaygroundWeb.Router do
  use PhoenixEtsPlaygroundWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", PhoenixEtsPlaygroundWeb do
    pipe_through :browser

    get "/start", PageController, :start
    get "/stop", PageController, :stop
    get "/add", PageController, :add
  end
end
