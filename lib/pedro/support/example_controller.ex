defmodule Pedro.ExampleController do
  use Plug.Builder
  import Plug.Conn
  import Pedro.Controller

  # plug :ensure_authorized!

  @fallback_plug Pedro.Controller.ExampleFallback

  def call(conn, action: action) do
    conn = super(conn, [])

    unless conn.state == :sent or conn.halted do
      apply_action(conn, action)
    else
      conn
    end
  end

  defp apply_action(conn, action) do
    case apply(__MODULE__, action, [conn, conn.params]) do
      %Plug.Conn{} = conn -> conn
      other -> @fallback_plug.call(conn, other)
    end
  end

  def greet(conn, _params) do
    conn
    |> put_status(200)
    |> render(:json, %{data: "Hello, world!"})
  end

  def redirect_greet(conn, params) do
    case validate_params(params) do
      :ok -> conn |> redirect(to: "/greet")
      other -> other
    end
  end

  defp validate_params(%{"greet" => "true"}), do: :ok
  defp validate_params(_), do: {:error, :bad_params}

  defp ensure_authorized!(conn, _options) do
    if authorized?(conn) do
      conn
    else
      conn
      |> put_status(401)
      |> render(:json, %{error: "Unauthorized"})
      |> halt()
    end
  end

  defp authorized?(conn) do
    auth_header = get_req_header(conn, "authorization")
    auth_header == ["Bearer #{token()}"]
  end

  defp token, do: "secret"
end
