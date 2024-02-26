defmodule Pedro.ExampleRouter do
  use Plug.Router

  plug Plug.Parsers,
    parsers: [:urlencoded, :json],
    json_decoder: Jason

  plug :match
  plug :dispatch


  get "/greet" do
    Pedro.ExampleController.call(conn, action: :greet)
  end

  get "/redirect_greet" do
    Pedro.ExampleController.call(conn, action: :redirect_greet)
  end


  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
