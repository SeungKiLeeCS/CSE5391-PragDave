defmodule Fib do
  @spec of(pos_integer())::pos_integer()
  def of(1), do: 1
  def of(2), do: 1

  # O(n^1.6)
  # def of(n), do: of(n-2) + of(n-1)

  # O(mn)
  def of(n), do: memo(n-2, 1, 1)
  defp memo(1, n2, n1), do: n2+n1
    defp memo(left, n2, n1) do
      memo(left-1, n1, n1+n2)
    end
end

20..30 |> Enum.each(fn n ->
  {time, value} = :timer.tc(fn -> Fib.of (n) end)
  IO.puts "number #{n} , time #{time} , value #{value}"
end)
