# signature -> sorted list of char
# Logic
  # word -> list of sorted chars (signature) -> list_equals

defmodule Anagram do

  # Single Anagram
  @spec signature_of(binary()) :: [any()]
  def signature_of(word) do
   word
   |> String.codepoints()
   |> Enum.sort()
  end

  @spec test?(binary(), binary()) :: boolean()
  def test?(word1, word2) do
    signature_of(word1) == signature_of(word2)
  end

  # Compared to a Dictionary of Word
  # -> Map the Anagram of the words into a state

  def wordlength(word), do: String.length(word) > 3

  def load_signatures(word_list \\ "/usr/share/dict/words") do
    # \\ means defaut parameter
    # file -> word & list -> map
    word_list
    |> File.read!()
    |> String.split(~r/\n/)
    |> Enum.filter()
  end

  def of_word(word, signatures) do
    signature = signature_of(word)
    signatures[signature]
  end
end

# Input -> (Transformation <-> State) -> Output
# Transformation <-> State is what we generally call Object in OOP languages.
