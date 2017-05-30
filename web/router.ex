defmodule JustpushitApi.Router do
  use JustpushitApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JustpushitApi do
    pipe_through :api
  end
  
end
