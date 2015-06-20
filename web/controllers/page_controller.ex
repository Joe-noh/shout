defmodule Shout.PageController do
  use Shout.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
