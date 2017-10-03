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

  describe '#in_journey' do
    it 'returns status' do
      expect(oystercard).not_to be_in_journey
    end
  end

  describe '#touch_in' do

    it 'updates in_journey to true' do
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end

  end

  describe '#touch_out' do
    it 'updates in_journey to false' do
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

  end


end
