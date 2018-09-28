defmodule Promise do
  # task = Task.async(func) -> promise
  # result = Task.await(task)

  def test_task(func) do
    Task.async(func)
  end

  def test_time() do
    :timer.tc(
      fn ->
      (1 .. 100000)
      |> Enum.each(
        fn _ ->
          1+1
        end)
      end)
  end

end
