defmodule Pedro.Controller.ExampleFallback do
  import Plug.Conn
  import Pedro.Controller

  def call(conn, {:error, :bad_params}) do
    conn
    |> put_status(400)
    |> render(:json, %{error: "Bad parameters"})
  end

  def call(conn, _) do
    conn
    |> put_status(500)
    |> render(:json, %{error: "Internal server error"})
  end

end
