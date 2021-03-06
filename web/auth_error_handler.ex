defmodule JustpushitApi.AuthErrorHandler do
 use JustpushitApi.Web, :controller

 def unauthenticated(conn, params) do
  conn
   |> put_status(401)
   |> render(JustpushitApi.ErrorView, "401.json")
 end

 def unauthorized(conn, params) do
  conn
   |> put_status(403)
   |> render(JustpushitApi.ErrorView, "403.json")
 end
end
