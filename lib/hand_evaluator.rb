require './lib/hand'
require './lib/hand_ranking'
class HandEvaluator
  def return_stronger_hand(left, right)
    @left = HandRanking.rank_hand(left)
    @right = HandRanking.rank_hand(right)

    if @left.kind == @right.kind
      [@left, @right].max_by { |h| h.rank.join.to_i}.hand
    else
      [@left, @right].max_by { |h| h.kind }.hand
    end
  end
end
