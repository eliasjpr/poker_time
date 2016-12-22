require './lib/card'
require './lib/hand_ranking'
class Hand
  attr_reader :cards, :hand_cards

  def initialize(cards)
    @hand_cards = cards
    @cards = cards.map { |card| Card.new(*card.chars) }
  end
end
