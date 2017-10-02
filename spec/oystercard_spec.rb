require './lib/oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'check a new card has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'allow a card to be topped up' do
      balance = oystercard.balance
      # amount = 10
      # expect(oystercard.top_up(amount)).to eq balance + amount
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end
end
