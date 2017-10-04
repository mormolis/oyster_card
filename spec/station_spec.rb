require 'station'

describe Station do

  let(:name) { 'station_name' }
  let(:zone) { 'zone' }
  subject(:station) { described_class.new(name: name, zone: zone) }

  describe '#name' do

    it 'stores the name of the station' do
      expect(station.name).to eq name
    end

  end  

  describe '#zone' do
    
        it 'stores the zone of the station' do
          expect(station.zone).to eq zone
        end
    
      end  

end

