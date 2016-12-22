require './lib/hand'
class HandRanking

  Rank = Struct.new(:kind, :rank, :hand)

  HAND_RANKINGS = {
    royal_flush: 8, four_of_kind: 7, full_house: 6, flush: 5, straight: 4,
    three_of_kind: 3, two_pair: 2, one_pair: 1, high_card: 0
  }.freeze

  def self.rank_hand(hand)
    new(hand).rank_hand
  end

  def initialize(hand)
    @hand = Hand.new(hand)
    @rankings = @hand.cards.map(&:rank)
    @suits = @hand.cards.map(&:suit_rank)
    @counts = card_count
    @cards = counts.keys
    @values = counts.values.sort
  end

  def rank_hand
    Rank.new(HAND_RANKINGS[kind], rank, hand.hand_cards )
  end

  private

  attr_reader :rankings, :suits, :hand, :cards, :suits, :counts, :values

  def pairs
    case kind
    when :royal_flush
      rankings.reverse << suits.uniq
    when :straight
      rankings.reverse
    when :flush
      [suits.uniq, cards.max]
    when :full_house
      kind_by(3) + kind_by(2)
    when :four_of_kind
      kind_by(4)
    else
      kind_by(HAND_RANKINGS[kind])
    end
  end

  def kind_by(n)
    counts.select { |_, v| v == n }.keys
  end

  def rank
    [HAND_RANKINGS[kind]] + pairs.reverse
  end

  def kind
    case
    when straight? && flush? then :royal_flush
    when four_of_kind? then :four_of_kind
    when full_house? then :full_house
    when flush? then :flush
    when straight? then :straight
    when three_of_kind? then :three_of_kind
    when two_pair? then :two_pair
    when one_pair? then :one_pair
    else :high_card
    end
  end

  def card_count
    rankings.group_by { |x| x }.each_with_object({}) do |e, a|
      a[e.last.first] = e.last.size
    end
  end

  def four_of_kind?
    values == [1, 4]
  end

  def full_house?
    values == [2, 3]
  end

  def three_of_kind?
    values == [1, 1, 3]
  end

  def two_pair?
    values == [1, 2, 2]
  end

  def one_pair?
    values == [1, 1, 1, 2]
  end

  def royal_flush?
    straight? && flush?
  end

  def flush?
    suits.uniq.size.eql? 1
  end

  def straight?
    (rankings.max - rankings.min) == 4
  end
end
