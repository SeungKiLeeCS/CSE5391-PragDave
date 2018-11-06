defmodule Play1 do
  # # Ran at run time
  # def now do
  #   IO.puts DateTime.utc_now()
  # end

  if System.get_env("TYPE") == "test" do
    def func do
      IO.puts "in test"
    end

  else
    def func do
      IO.puts "Not in test"
    end
  end

end

# # run at compile time
# IO.puts DateTime.utc_now()

# # run at compile time as well -> why?
# Play.now()

defmodule Play2 do
  # server side resetting state -> don't want it to be visible to prod
  if Mix.env == :test do
    # Only available in test env
    def reset() do
      # ...
    end
  end
end

defmodule Play3 do
  # Will store the file in beam.
  # @name File.read!()
  def dictionary do
#    File.read!("...")
  end
end

# Have README.md be same as the moduledoc
# @moduledoc File.read("README.md")


# Compile Time <|> Run Time. The line is blurr

# module has to be compiled before the function can be called -> defmodule will place the module in queue
# -> it will compile when that module is called -> adds the code ot the running image
# -> if the modules are not used, it won't be compiled
# -> def and defmodule are both macros -> it also is added to the queue for running img
# -> even def and defmodule can be overwritten
# -> macros are just functions treated differently in compile time

# Intercepting Change and Reemitting -> This can control the lang -> Macros

defmodule Play do
  defmacro print(param) do
    # param |> IO.inspect
    # # This will return nil, with the params processed
    # nil

    quote do
      # This gives Unquote called outside quote on line 76 -> in usemacro. Why?
      # param
      # |> unquote()
      # |> IO.puts()

      # This works
      IO.puts(unquote(param))
    end

  end

  # Returns just nil
  def usemacro() do
    print(1+2)
  end
end

# require Play -> This will compile the macro. -> so people know what they are using
# Otherwords, macros will not compile if don't require

# Datatypes where AST = Data
# AST of String, Number, Atom, List are just themselves
