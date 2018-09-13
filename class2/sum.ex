defmodule Listmethod do
  # Sum of the elements in a list
  def lsum([]), do: 0
  def lsum([head|tail]), do: head + lsum(tail)

  # length of the list
  def lenlist([]), do: 0
  def lenlist([_head|tail]), do: 1 + lenlist(tail)
  # _head -> I am not intending to use ti
  # Fix the warnings

  # def upcase([]), do: []
  # def upcase([h|t], do: [String.upcase(h)|upcase(t)])

  # def length([]), do: []
  # def length([h|t], do: [String.length(h) | length(t)])


  # PASSING IN Functions -> MAP
  def map([], _func), do: []
  def map([h|t], func), do: [func.(h)|map(t, func)]

  # PASSING IN Functions -> REDUCE
  def reduce([h|t], func), do: reduce(t,h,func)
  def reduce([], _state, _func), do: []
  def reduce([h|t], state, func), do: reduce(t, func.(h, state), func)

  # def listsum(list), do: reduce(list, 0, fn (value, state) -> value +state end)

  # def max([h|t]), do: reduce(t, h, fn(value, max_so_far) -> max(value, max_so_far) end)
  # ->
  def max(list), do: reduce(list, fn(value,max_so_far) -> max(value, max_so_far) end)

end

# 1,2,3,4,5 를 더하면 15가 나온다. 이처럼 a + a+1 + ... + b = a..b가 되는 리스트는 무엇인가?
