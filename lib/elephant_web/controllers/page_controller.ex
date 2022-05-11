defmodule ElephantWeb.PageController do
  use ElephantWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
