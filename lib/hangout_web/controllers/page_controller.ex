defmodule HangoutWeb.PageController do
  use HangoutWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
