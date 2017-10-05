require 'journey'

describe Journey do
  let(:oyster) { double(Oyster) }
  let (:entry_station) {double(Station)}
  let (:exit_station) {double(Station)}
  let(:journey) { described_class.new(:entry_station) }


  describe '#in_journey' do
    it 'returns status' do
      expect(journey).not_to be_in_journey
    end
  end
end

