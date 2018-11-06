defmodule Canvas do

  def letter(),                                        do: raise ExUnit.AssertionError
  def letter(grade) when 90 <= grade and grade <= 100, do: "A"
  def letter(grade) when 80 <= grade and grade < 90,   do: "B"
  def letter(grade) when 60 <= grade and grade < 80,   do: "C"
  def letter(grade) when 50 <= grade and grade < 60,   do: "D"
  def letter(grade) when grade < 500,                  do: "F"
end
