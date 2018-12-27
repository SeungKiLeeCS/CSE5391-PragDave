defmodule Spec do

    @type t :: %__MODULE__{
        turns_left: integer,
        winner: :x | :o
    }

    defstruct(
        turns_left: "10",
        winner:     nil
    )            

    @spec new() :: Spec.t()
    def new() do
        %__MODULE__{ }
    end

    @spec one_less_turn(Specs.t()) :: number()
    def one_less_turn(state) do
        state.turns_left - 1
    end
end