defmodule KV.Store do

  use GenServer
  @me __MODULE__

  #API
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: @me)
  end

  def start default  \\ [] do
    GenServer.start __MODULE__, default |> Enum.into(%{}), name: @me
  end

  def set key, value do
    GenServer.cast @me, {:set, key, value}
  end

  def get key do
    GenServer.call @me, {:get, key}
  end

  #Implementation
  def init args do
    {:ok, args}
  end

  def handle_cast {:set, key, value}, state do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call {:get, key}, _from, state do
    {:reply, state[key], state}
  end

end
