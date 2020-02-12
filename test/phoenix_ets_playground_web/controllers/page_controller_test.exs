defmodule PhoenixEtsPlaygroundWeb.PageControllerTest do
  use PhoenixEtsPlaygroundWeb.ConnCase

  describe "testing endpoints" do
    test "GET /start", %{conn: conn} do
      conn = get(conn, "/start")
      assert response(conn, 200) =~ "ETS started!"
      _conn = get(conn, "/stop")
    end

    test "GET /stop", %{conn: conn} do
      _conn = get(conn, "/start")
      conn = get(conn, "/stop")
      assert response(conn, 200) =~ "ETS stopped!"
    end

    test "GET /add", %{conn: conn} do
      _conn = get(conn, "/start")
      conn = get(conn, "/add")
      assert response(conn, 200) =~ "ETS add!"
      _conn = get(conn, "/stop")
    end
  end
end
