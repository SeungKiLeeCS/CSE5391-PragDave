defmodule Named do

  # One (*)
  def fizzbuzz(a), do: checkfb(a)
    defp checkfb(a) when rem(a,15) == 0, do: "Fizzbuzz"
    defp checkfb(a) when rem(a,5) == 0, do: "Buzz"
    defp checkfb(a) when rem(a,3) == 0, do: "Fizz"
    defp checkfb(a), do: a

  # Two (*)
  def secondout([a,b|c]), do: IO.inspect(b)
  def secondout([a|b]), do: IO.inspect(b)

  # Three (*)
  def gcd(a,0), do: a
  def gcd(a,b), do: gcd(b, rem(a,b))

  # Four
  def errorcode(200), do: "OK"
  def errorcode(404), do: "Not found"
  def errorcode(a), do: "Error <<#{a}>>"

  # Five
  def tuplesum({a,b}), do: a+b
  def tuplesum({a,b,c}), do: a+b+c

  # Six (*)
  def twincest([a,b]), do: a == b

  # Seven (*)
  def returnthing(1), do: "1 thing"
  def returnthing(n), do: "#{n} things"

  # Eight (*)
  def rsum(0), do: 0
  def rsum(1), do: 1
  def rsum(n), do: n + rsum(n-1)

  # Nine
  def checkval(a,b), do: a == b

end

defmodule Anonymous do

  # Two
  secondout = fn([a|b]) -> IO.inspect(b) end
  secondout = fn([a,b]) -> IO.inspect(b) end
  secondout = fn([a,b|c]) -> IO.inspect(b) end

  # Three
  gcd = fn(a,0) -> a end
  # gcd = fn(a,b) -> fn(b, rem(a,b)) end

  # Four (*)
  errorcode = fn(200) -> "OK" end
  errorcode = fn(404) -> "Not found" end
  errorcode = fn(a) -> "Error <<#{a}>>" end

  # Five (*)
  tuplesum = fn({a,b}) -> a+b end
  tuplesum = fn({a,b,c}) -> a+b+c end

  # Seven
  returnthing = fn(1) -> "1 thing" end
  returnthing = fn(n) -> "#{n} things" end

end
