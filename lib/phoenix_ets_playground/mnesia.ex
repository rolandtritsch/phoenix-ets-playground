defmodule PhoenixEtsPlayground.Mnesia do
  @moduledoc false

  use GenServer

  require Logger
  require Ex2ms

  def init(args) do
    Logger.info("enter: #{inspect(args)}")
    :ok = open_mnesia()
    {:ok, {}}
  end

  def stop() do
    Logger.info("enter")
    GenServer.stop(:kvs)
  end

  def add() do
    Logger.info("enter")
    :ok = GenServer.call(:kvs, {:add, :rand.uniform(1000)})
  end

  def terminate(reason, state) do
    Logger.info("enter: #{inspect(reason)}/#{inspect(state)}")

    filter = Ex2ms.fun do {_tab, timestamp, value} when value > 0 -> {timestamp, value} end
    {:atomic, result} = :mnesia.transaction(fn ->
      case :mnesia.select(KVS, filter, 100, :read) do
        :"$end_of_table" -> []
        {result, _cont} -> result
      end
    end)

    Logger.info("dump: #{inspect(result)}")
  end

  def handle_call({:add, value}, from, state) do
    Logger.info("enter: #{inspect(value)}/#{inspect(from)}/#{inspect(state)}")
    :ok = :mnesia.dirty_write({KVS, DateTime.utc_now(), value})
    {:reply, :ok, state}
  end

  # ---

  defp open_mnesia() do
    :mnesia.stop()
    :mnesia.delete_schema([node()])
    :ok = :mnesia.create_schema([node()])
    :ok = :mnesia.start()

    :mnesia.delete_table(KVS)
    {:atomic, :ok} = :mnesia.create_table(KVS, [attributes: [:timestamp, :value]])
    :mnesia.wait_for_tables([KVS], 1000)
  end

end
