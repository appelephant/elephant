defmodule ElephantWeb.PageControllerTest do
  use ElephantWeb.ConnCase

  @moduletag :integration

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
