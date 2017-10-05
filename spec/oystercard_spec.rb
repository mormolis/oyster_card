require './lib/oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:entry_station) {double('station')}
  let(:exit_station) {double('station')}
  let(:journey) {double('journey')}

  let(:minimum_balance) { Oystercard::MINIMUM_BALANCE }
  let(:maximum_balance) { Oystercard::MAXIMUM_BALANCE }
  # let(:minimum_fare) { Oystercard::MINIMUM_FARE }
  # let(:maximum_fare) { Oystercard::MAXIMUM_FARE }

  describe '#balance' do
    it 'check a new card has a balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'allow a card to be topped up' do
      expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end
    it 'throws exception if top-up limit is exceeded' do
      expect { oystercard.top_up maximum_balance + 1 }
        .to raise_error "Card limit #{maximum_balance} exceeded!"
    end
  end

  describe '#touch_in' do

    it 'starts a journey' do
      oystercard.top_up(maximum_balance)
      allow(oystercard).to receive(:journey)
      allow(oystercard.journey).to receive(:fare) {1}
      expect(oystercard.journey).to receive(:start).with(entry_station)
      oystercard.touch_in(entry_station)
    end
    it 'only allows touch in if the card has a minimum balance' do
      expect { oystercard.touch_in(entry_station) }
        .to raise_error "Card balance below minimum of #{minimum_balance}!"
    end
    it 'will charge a penalty if fail to touch in' do
      oystercard.top_up(maximum_balance)
      allow(oystercard).to receive(:journey)
      allow(oystercard.journey).to receive(:start).with(entry_station)
      allow(oystercard.journey).to receive(:fare).and_return(6)
      expect{oystercard.touch_in(entry_station)}.to change{ oystercard.balance}.by -6
    end

  end

  describe '#touch_out' do

    before do
      oystercard.top_up(minimum_balance)
      oystercard.touch_in(entry_station)
    end
    it 'deducts the minimum fare' do 
      allow(oystercard.journey).to receive(:fare).and_return(1)
      expect { oystercard.touch_out(exit_station) }.to change {oystercard.balance}.by (-1)
    end
    it 'ends a journey' do
      # allow(oystercard).to receive(:journey)
      expect(oystercard.journey).to receive(:end).with(exit_station)
      oystercard.touch_out(exit_station)
    end
  end

  describe '#journey_history' do

    let(:journey) { double(Journey) }

    xit 'returns journey history' do
      # pending("testing journey class")
      oystercard.top_up maximum_balance
      oystercard.touch_in entry_station
      oystercard.touch_out exit_station
      expect(oystercard.journey_history).to include journey
    end
  end

end
