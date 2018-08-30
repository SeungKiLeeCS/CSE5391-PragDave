defmodule List do
  # Sum of the elements in a list
  def lsum([]), do: 0
  def lsum([head|tail]), do: head + sum(tail)

  # length of the list
  def lenlist([]), do: 0
  def lenlist([head|tail]), do: 1 + lenlist(tail)

end

# 1,2,3,4,5 를 더하면 15가 나온다. 이처럼 a + a+1 + ... + b = a..b가 되는 리스트를 찾아라는 무엇인가?
