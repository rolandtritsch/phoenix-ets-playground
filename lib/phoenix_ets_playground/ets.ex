defmodule PhoenixEtsPlayground.Ets do
  @moduledoc false

  use GenServer

  require Logger

  def start(args) do
    Logger.debug("enter: #{inspect(args)}")
    GenServer.start(__MODULE__, args, name: __MODULE__)
  end

  def start_link(args) do
    Logger.debug("enter: #{inspect(args)}")
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(args) do
    Logger.debug("enter: #{inspect(args)}")
    Process.flag(:trap_exit, :true)
    table = :ets.new(:doesnt_matter, [:set, :private])
    {:ok, {table}}
  end

  def stop() do
    Logger.debug("enter")
    GenServer.stop(__MODULE__)
  end

  def add() do
    Logger.debug("enter")
    :ok = GenServer.call(__MODULE__, {:add, :rand.uniform(1000)})
  end

  def terminate(reason, {table} = state) do
    Logger.debug("enter: #{inspect(reason)}/#{inspect(state)}")
    Logger.info("dump: #{inspect(:ets.tab2list(table))}")
  end

  def handle_call({:add, value}, _from, {table} = state) do
    Logger.debug("enter: #{inspect(value)}/#{inspect(state)}")
    true = :ets.insert_new(table, {DateTime.utc_now(), value})
    {:reply, :ok, state}
  end
end
