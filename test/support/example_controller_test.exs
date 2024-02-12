defmodule Pedro.ExampleControllerTest do
  use ExUnit.Case
  use Plug.Test

  describe "GET /greet" do
    test "responds with 200 status" do
      conn =
      conn(:get, "/greet")
      |> Pedro.ExampleRouter.call([])

      assert conn.status == 200
      assert conn.resp_body == Jason.encode!(%{data: "Hello, world!"})
    end
  end

  describe "GET /redirect_greet" do
    test "responds with 302 status" do
      conn =
      conn(:get, "/redirect_greet")
      |> Pedro.ExampleRouter.call([])

      assert conn.status == 302
      assert conn.resp_body =~ "You are being"
      assert conn.resp_body =~ "redirected"
      assert Plug.Conn.get_resp_header(conn, "location") == ["/greet"]
    end
  end
end
