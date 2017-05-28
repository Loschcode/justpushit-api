defmodule JustpushitApi.Router do
  use JustpushitApi.Web, :router

  # Unauthenticated Requests
  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  # Authenticated Requests
  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/", JustpushitApi do
    pipe_through :api

    # Channels
    resources "/channels", ChannelController do
    end

  end

  # not working properly yet
  scope "/", JustpushitApi do
    pipe_through :api_auth

    get "/user/current", UserController, :current
  end

end
