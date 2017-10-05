require 'journey'

describe Journey do

  let(:journey) { described_class.new }
  let(:oyster) { double('oyster') }
  let (:station) {double('station')}
  
  describe '#in_journey' do

    it 'returns status' do
      expect(journey).not_to be_in_journey
    end

  end

  describe '#start_at' do

    it 'updates in_journey to true' do
      journey.start_at(station)
      expect(journey).to be_in_journey
    end

  end

  describe '#end' do

    it 'updates in_journey to false' do
      journey.start_at(station)
      journey.end_at(station)
      expect(journey).not_to be_in_journey
    end

  end
  
end

