defmodule CanvasTest do
  use ExUnit.Case
  doctest Canvas

  # Happy Path
  test "Happy Path" do
    assert Canvas.letter(95) == "A"
  end

  # Boundary
  describe "Boundary Tests" do
    test "On the Edge A" do
      assert Canvas.letter(90) == "A"
    end

    test "Float Tests" do
      assert Canvas.letter(89.99999999) == "B"
    end

  end

  # # Error
  # describe "Error Path" do
  #   test "No Input Error" do
  #     assert_raise Canvas.letter()
  #     # assert Canvas.letter() == 0
  #   end
  # end
end
