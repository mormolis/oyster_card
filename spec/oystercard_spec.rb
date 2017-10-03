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
      expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end

    it 'throws exception if top-up limit is exceeded' do
      expect { oystercard.top_up Oystercard::MAXIMUM_BALANCE + 1 }.to raise_error "Card limit #{Oystercard::MAXIMUM_BALANCE} exceeded!"
    end
  end

  describe '#deduct' do
    it 'deducts an amount from the balance of the card' do
      oystercard.top_up(20)
      expect { oystercard.deduct 10}.to change { oystercard.balance }.by -10
    end

  end
end
