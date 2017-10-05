require 'journey'

describe Journey do

  let(:journey) { described_class.new }
  let(:oyster) { double('oyster') }
  let(:station) {double('station')}
  let(:minimum_fare) { Journey::MINIMUM_FARE }
  let(:maximum_fare) { Journey::MAXIMUM_FARE }
  
  describe '#complete?' do

    it 'returns whether a journey is complete or not' do
      expect(journey).not_to be_complete
    end

  end

  describe '#start_at' do

    it 'updates in_journey to true' do
      journey.start(station)
      expect(journey).not_to be_complete
    end

  end

  describe '#end' do

    it 'updates in_journey to false' do
      journey.start(station)
      journey.end(station)
      expect(journey).to be_complete
    end

  end

  describe '#fare' do

    context 'mimimum fare' do

      it 'returns the minimum fare for the journey' do
        journey.start(station)
        journey.end(station)
        expect(journey.fare).to eq minimum_fare
      end
      
    end
    context 'maximum fare' do

      it 'returns the maximum fare when no entry station' do
        journey.end(station)
        expect(journey.fare).to eq maximum_fare
      end

    end

  end
  
end

