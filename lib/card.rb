class Card
  # The order of rankings and suits is VERY IMPORTANT (low to high) for ranking
  RANKINGS = %w(2 3 4 5 6 7 8 9 T J Q K A).freeze
  SUITS = %w(C D H S).freeze

  def self.build_deck
    RANKINGS.compact.inject([]) do |deck, rank|
      deck << SUITS.map { |s| "#{rank}#{s}" }
    end.flatten
  end

  attr_reader :num, :suit

  def initialize(num, suit)
    @num = num
    @suit = suit
  end

  def suit_rank
    SUITS.index(suit)
  end

  def rank
    RANKINGS.index(num)
  end
end
