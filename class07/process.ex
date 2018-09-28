# functions
'''
send self, "message" -> sends the message to mailbox
flush -> pops all messages from mailbox
'''

defmodule ProcessDemo do
  # ex pattern match
  def greet() do
    receive do
      "Kim Jung Eun" ->
        IO.puts("My Leader")

      name ->
        IO.puts("Hello #{name}")
    end
  end

  def getter() do
    # can pattern match here like case statement
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
