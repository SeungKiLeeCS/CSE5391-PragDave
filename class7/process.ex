defmodule ProcessDemo do
  def greet() do
    receive do
      "Kim Jung Eun" ->
        IO.puts("My Leader")

      name ->
        IO.puts("Hello #{name}")
    end
  end

  def getter() do
    # can pattern match here
    # Timeout -> if the process is spawned and not used.
    receive do
      msg ->
        IO.puts("#{inspect(self())}, got #{inspect(msg)}")
    after
      1000 ->
        IO.puts("DONE")
    end
  end
end

# receive do < {:atom, param} -> operation > end
