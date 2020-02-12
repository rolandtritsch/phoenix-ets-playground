defmodule PhoenixEtsPlayground.Ets do
  @moduledoc false

  use GenServer

  require Logger

  def init(args) do
    Logger.info("enter: #{inspect(args)}")
    table = :ets.new(:doesnt_matter, [:set, :private])
    {:ok, {table}}
  end

  def stop() do
    Logger.info("enter")
    GenServer.stop(:kvs)
  end

  def add() do
    Logger.info("enter")
    :ok = GenServer.call(:kvs, {:add, :rand.uniform(1000)})
  end

  def terminate(reason, {table} = state) do
    Logger.info("enter: #{inspect(reason)}/#{inspect(state)}")
    Logger.info("dump: #{inspect(:ets.tab2list(table))}")
  end

  def handle_call({:add, value}, _from, {table} = state) do
    Logger.info("enter: #{inspect(value)}/#{inspect(state)}")
    true = :ets.insert_new(table, {DateTime.utc_now(), value})
    {:reply, :ok, state}
  end
end
