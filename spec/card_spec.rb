require 'spec_helper'
require './lib/card'

RSpec.describe Card do
  let(:expected_deck) { File.read('./spec/fixtures/deck.txt').split(/\s/) }

  describe '.build_deck' do
    it 'builds a deck of 52 unique cards' do
      deck = Card.build_deck
      expect(deck).to eq expected_deck
      expect(deck.size).to eq 52
      expect(deck.uniq.size).to eq 52
    end
  end
end
