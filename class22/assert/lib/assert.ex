defmodule Assert do

  defmacro assert(param) do
    handle(param)
  end

  def handle (assertion = {op, _, [lhs, rhs]}) do
    # Test happens at the run time because there maybe some value in queue needed to run it
    # For checking
    meta_code = quote do

      # Assign Value
      lv = unquote(lhs)
      rv = unquote(rhs)

      # lv == rv
      # == (lv, rv)
      # Kernel.unquote(op)(lv, rv)
      if !(Kernel.unquote(op)(lv, rv)) do
        IO.puts unquote(Macro.to_string(assertion))
        IO.puts "Failed Assertion"
      else
        IO.puts "OK"
      end
    end
    IO.puts Macro.to_string(meta_code)
    meta_code
  end

  defmacro __using__(_) do
    quote do
      require Assert
      import Assert, only: [assert: 1]
    end

    # Can also inject functions here for the module using this module.
    # to override this function, use
    # defoverridable(func_name: arity)
  end
end

defmodule TryAssert do
  use Assert

  # wrap in function to see the action in runtime
  def run() do
    IO.puts "before"
    assert 2 == 3
    IO.puts "after"
  end
end

# Homoiconic
# same representation for code as data -> ex: lisp
