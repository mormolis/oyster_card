require './lib/oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'check a new card has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end
end
