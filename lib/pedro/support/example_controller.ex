defmodule Pedro.ExampleController do
  import Pedro.Controller
  import Plug.Conn

  def call(conn, action: action) do
    apply(__MODULE__, action, [conn, conn.params])
  end

  def greet(conn, _params) do
    conn
    |> put_status(200)
    |> render(:json, %{data: "Hello, world!"})
  end

  def redirect_greet(conn, _params) do
    conn
    |> redirect(to: "/greet")
  end
end
