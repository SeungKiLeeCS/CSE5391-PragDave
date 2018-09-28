# Initial Code -> No Repeat
defmodule Game do

  def handle_guess(range, move_count) do
    guess = (range) |> div(2)
    answer = IO.gets("is it #{guess}: ") |> String.trim |> String.downcase
    updated_count = move_count+1

    { update_val(answer, guess, range), updated_count }
  end

  def update_val(score, guess, {_min, max})
    when score == "l",
    do: {1+guess, max}

  def update_val(score, guess, {min, _max})
    when score == "h",
    do: {min, guess-1}

end

  # Function to process Guesing
  # 1. Guess is always the mid point of the range for binary search, round up or down
  # 2. the user will respond to the guess with an answer yes, lower, higher, indicating where the number is relative to the guess [ylh]

    # base case -> if the guess is correct (line 47)
    # for Lower / Higher, return new tuple that will update min / max and add a move_count

# New Code -> Recursive
defmodule WorkingGame do

  def handle_guess({:ok, move_count}) do
    "I got the answer in: #{move_count} moves."
    |> IO.puts
  end

  def handle_guess({min, max, move_count}) do
    guess = min+max |> div(2)

    response = IO.gets("Is the number #{guess}: ")
    |> String.trim
    |> String.downcase

    handle_response(response, guess, {min, max, move_count})
    |> handle_guess()
  end

  def handle_response("y", _guess, {_min, _max, move_count}) do
    {:ok, move_count}
  end

  def handle_response("l", guess, {min, _max, move_count}) do
    {min, guess-1, move_count+1}
  end

  def handle_response("h", guess, {_min, max, move_count}) do
    {guess+1, max, move_count+1}
  end

end


# PragDave's
defmodule DaveGame do

  # Put the state and logic in the different module
  defmodule State do
    defstruct(
      # set defaults
      min: 0,
      max: 100,
      move_count: 0
    )
  end

  # Don't have to have 3 param. Separate the function
  def play_game(min, max) do
    handle_guess(%Game(min: min, max: max))
    # handle_guess({min, max, 0})
  end

  def handle_guess({min, max, move_count}) do
    guess = min+max |> div(2)
    get_response(guess)
    |> handle_response({min, max, move_count})
  end

  def get_response(guess) do
    "Is it #{guess}? [hly]: "
    |> IO.gets
    |> String.trim
    |> String.downcase
  end

  def handle_response("y", {_min, _max, move_count}) do
    IO.puts("Got it in #{move_count} guesses.")
  end

  def handle_response("l", guess, {_min, max, move_count}) do
    { guess+1, max, move_count+1 }
    |> handle_guess()
  end

  def handle_response("h", guess, {min, _max, move_count}) do
    { min, guess-1, move_count+1 }
    |> handle_guess()
  end

end

# How to improve code
# Always look at state. You can use struct.
# 튜플을 쓰면 나중에 update할때 자료형을 다 바꿔줘야 함. 3 elem tuple -> 6 elem tuple이 되면 그거에 의존하는 모든 자료가 박살남
# struct를 쓰면 나중에 자료형을 더해도 별 문제가 없음
