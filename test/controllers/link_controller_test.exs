defmodule JustpushitApi.ChannelControllerTest do
  use JustpushitApi.ConnCase

  alias JustpushitApi.Channel
  @valid_attrs %{description: "some content", title: "some content", url: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, link_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    link = Repo.insert! %Channel{}
    conn = get conn, link_path(conn, :show, link)
    assert json_response(conn, 200)["data"] == %{"id" => link.id,
      "title" => link.title,
      "description" => link.description,
      "url" => link.url}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, link_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, link_path(conn, :create), link: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Channel, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, link_path(conn, :create), link: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    link = Repo.insert! %Channel{}
    conn = put conn, link_path(conn, :update, link), link: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Channel, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    link = Repo.insert! %Channel{}
    conn = put conn, link_path(conn, :update, link), link: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    link = Repo.insert! %Channel{}
    conn = delete conn, link_path(conn, :delete, link)
    assert response(conn, 204)
    refute Repo.get(Channel, link.id)
  end
end
