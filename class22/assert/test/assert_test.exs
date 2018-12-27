defmodule AssertTest do
  use ExUnit.Case
  doctest Assert

  test "greets the world" do
    assert Assert.hello() == :world
  end
end
