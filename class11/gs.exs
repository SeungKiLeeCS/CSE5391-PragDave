defmodule GS do

  use GenServer

  # API
  

  # Implementation -> 항상 functionality 를 만들어두고 API를 만들자
  def init(_) do
    IO.inspect server: self()
    { :ok, %{} }
  end

  # arg == {What I wanna do, key, value}
  def handle_cast({ :put, key, value }, state) do
    new_state = Map.put(state, key, value)
    { :noreply, new_state }
  end

  # handle_call({:get, key}, pid of sender, state)
  def handle_call({ :get, key }, _, state) do
    # { :reply, return_val, state}
    { :reply, Map.get(state, key), state }
  end

end

'''

'''
