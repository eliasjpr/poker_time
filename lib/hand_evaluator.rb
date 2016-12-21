require './lib/hand_ranking'
class HandEvaluator
  def return_stronger_hand(left, right)
    hands = [HandRanking.rank(left), HandRanking.rank(right)]

    if hands[0].kind == hands[1].kind
      hands.max_by(&:points)
    else
      hands.max_by(&:kind)
    end
  end
end
