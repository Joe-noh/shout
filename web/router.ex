defmodule Shout.Router do
  use Shout.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  socket "/ws", Shout do
    channel "topic:*", ShoutChannel
  end

  scope "/", Shout do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Shout do
  #   pipe_through :api
  # end
end
