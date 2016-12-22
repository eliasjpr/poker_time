require 'spec_helper'
require './lib/hand'
require './lib/hand_ranking'

RSpec.describe HandRanking do
  describe '.rank' do
    @hand_kinds = {
      royal_flush: %w(AS KS TS JS QS),
      four_of_a_kind: %w(AS AC AH AD QS),
      full_house: %w(KS KC KH TD TS),
      flush: %w(2S 5S 6S JS QS),
      straight: %w(AD KS TC JS QS),
      three_of_a_kind: %w(2S 2C 2H 9D TS),
      two_pair: %w(KS KC 4H TD TS),
      one_pair: %w(AS 2C 3H 5D 5S),
      high_card: %w(AS KC 2H 3D 4S)
    }

    @hand_kinds.each_with_index do |(key, cards), i|
      it "ranks #{8 - i} for #{key}" do
        hand = HandRanking.rank_hand cards
        expect(hand.kind).to eq 8 - i
      end
    end
  end
end
