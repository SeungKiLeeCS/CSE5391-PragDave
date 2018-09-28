defmodule Counter do

  # \\ 0 is default
  def new(val_init \\ 0) do
    # start_link -> binds the process that spawns and process spawned.
    {:ok, pid } = Agent.start_link(fn -> val_init end)
    pid
  end

  def get(pid) do
    Agent.get pid, &( &1 )
  end

  def incr(pid, by \\ 1) do
    Agent.get_and_update(pid, fn state ->
      state = state + by
      {"Now its #{state}", state}
    end)
  end
end

# Module has nothing to do with process.
# function has to be independent of the context so it can return the same outcome.
# To define a function private, you cannot call it in atom. has to be called as fn -> function
