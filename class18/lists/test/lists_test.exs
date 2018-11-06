defmodule ListsTest do
  use ExUnit.Case
  doctest Lists

  # Set up
  setup do
    [ new_list: [1,2,3] ]
  end

  describe "Happy Path" do
    # Happy Path
    test "return sum of [3,4]" do
      assert Lists.sum([3,4]) == 7
    end
  end

  describe "Boundary" do
    # Boundary
    test "return with 1 element" do
      assert Lists.sum([1]) == 1
    end

    test "returns with 0 element" do
      assert Lists.sum([]) == 0
    end

    test "large list sum" do
      input = 1..1000 |> Enum.into([])
      assert Lists.sum(input) == 500 * 1001
    end
  end

end
