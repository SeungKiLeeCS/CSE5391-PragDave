defmodule BadFib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n-2) + fib(n-1)
end

defmodule MemoFib do
  def new() do
    {:ok, pid} = Agent.start_link ( %{0=>0, 1=>1} )
    pid
  end

  def fib(cache_pid, n) do
    Agent.get_and_update(cache_pid, &find_or_calc_fib(&1, n))
  end

  def find_or_calc(cache, n) do
    case cache[n] do
      # if I don't have the number n cache
      nil ->
        2 .. n
        # Cheap cuz its addition
        |> Enum.reduce( {0, cache}, &calc_next/2)
      number ->
        { number, cache }
    end
  end

  def calc_next(n, {_, cache}) do
    result = cache[n-2] + cache[n-1]
    # update cache
    { result, Map.put(cache, n, result) }
  end

end
