defmodule InternalAPI.Router do
  use Plug.Router

  plug(Plug.Logger, log: :debug)
  plug(:match)
  plug(:dispatch)

  get "/widgets" do
    body =
      %{
        api: __MODULE__,
        data: Widgets.all()
      }
      |> Jason.encode!()

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, body)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
