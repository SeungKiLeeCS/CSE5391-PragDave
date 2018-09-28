# has to have module for functions

defmodule Friendly do

  # def greet(name) do
  #   IO.puts "Hello #{name}"
  # end

  # # Code for Different Cases, not conditionals
  # def head([]),       do :empty
  # def head([h | _t]), do :h

  def greeter(greeting) do
    fn name -> "#{greeting}, #{name}" end
  end

end
