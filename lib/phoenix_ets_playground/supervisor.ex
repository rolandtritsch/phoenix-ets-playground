defmodule PhoenixEtsPlayground.EtsSupervisor do
  @moduledoc false

  use Supervisor

  require Logger

  alias PhoenixEtsPlayground.{
    Ets,
    DEts,
    Mnesia
  }

  def start(args) do
    Logger.debug("enter: #{inspect(args)}")
    Supervisor.start_child(PhoenixEtsPlayground.Supervisor, {__MODULE__, []})
  end

  def start_link(args) do
    Logger.debug("enter: #{inspect(args)}")
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(args) do
    Logger.debug("enter: #{inspect(args)}")

    children = [
      {Ets, []},
      {DEts, []},
      {Mnesia, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  def stop() do
    Logger.debug("enter")
    Supervisor.terminate_child(PhoenixEtsPlayground.Supervisor, __MODULE__)
    Supervisor.delete_child(PhoenixEtsPlayground.Supervisor, __MODULE__)
  end

  def add() do
    Logger.debug("enter")

    Ets.add()
    DEts.add()
    Mnesia.add()
  end
end
