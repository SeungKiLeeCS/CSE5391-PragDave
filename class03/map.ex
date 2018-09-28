defmodule RGB do

  defstruct(
    r: 0,
    g: 1,
    b: 0
  )

  def create (colors) do
    IO.inspect colors

    %RGB{r: colors[:r]}
  end

end
