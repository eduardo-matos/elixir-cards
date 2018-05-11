defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Gets 52 distinct cards" do
    assert length(Cards.create_deck) === 52
  end

  test "Contains tells if a given cards exists on deck" do
    deck = Cards.create_deck

    assert Cards.contains?(deck, "Nine of Hearts")
    refute Cards.contains?(deck, "Joker")
  end

  test "Deal returns a hand of cards from deck" do
    deck = ["Ace of Spades", "Two of Hearts", "Three of Diamonds", "Four of Clubs"]

    assert length(Cards.deal(deck, 2)) == 2
    assert length(Cards.deal(deck, 3)) == 3
    assert length(Cards.deal(deck, 5)) == 4
    assert Cards.deal(deck, 3) |> MapSet.new |> MapSet.subset?(MapSet.new(deck)) 
  end
end
