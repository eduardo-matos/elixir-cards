defmodule Cards do
  @moduledoc """
    Deals with decks of cards and some operations on them
  """

  def create_deck do
    decks = ["Spades", "Diamonds", "Hearts", "Clubs"]
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]

    for value <- values, deck <- decks do
      "#{value} of #{deck}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Verifies if deck contains specific card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
      iex> Cards.contains?(deck, "Joker")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.take_random(deck, hand_size)
  end

  def save(deck, filename) do
    File.write(filename, :erlang.term_to_binary(deck))
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error,_reason} -> "Oops! File not found"
    end
  end
end
