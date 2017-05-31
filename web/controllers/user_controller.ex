defmodule JustpushitApi.UserController do
  use JustpushitApi.Web, :controller

  alias JustpushitApi.User
  plug Guardian.Plug.EnsureAuthenticated, handler: JustpushitApi.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(JustpushitApi.UserView, "show.json", user: user)
  end
end
