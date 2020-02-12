defmodule PhoenixEtsPlaygroundWeb.PageController do
  use PhoenixEtsPlaygroundWeb, :controller

  # alias PhoenixEtsPlayground.Ets, as: Ets
  # alias PhoenixEtsPlayground.DEts, as: Ets
  alias PhoenixEtsPlayground.Mnesia, as: Ets

  def start(conn, _params) do
    {:ok, _} = GenServer.start(Ets, [], name: :kvs)

    conn
    |> put_status(:ok)
    |> text("ETS started!")
  end

  def stop(conn, _params) do
    :ok = Ets.stop()

    conn
    |> put_status(:ok)
    |> text("ETS stopped!")
  end

  def add(conn, _params) do
    :ok = Ets.add()

    conn
    |> put_status(:ok)
    |> text("ETS add!")
  end
end
