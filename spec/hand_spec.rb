require 'spec_helper'
require './lib/hand'

RSpec.describe Hand do
  describe '.rank_hand' do
    let!(:left) { %w(AS KD TH JC QH) }
    let(:right) { %w(2C 5D 9S 3H TS) }

    it 'ranks a hand of cards' do
      hand1 = Hand.new(left)
      hand2 = Hand.new(right)

      expect(hand1.cards).to be_an Array
      expect(hand1.hand_cards).to eq left

      expect(hand2.cards).to be_an Array
      expect(hand2.hand_cards).to eq right
    end
  end
end
