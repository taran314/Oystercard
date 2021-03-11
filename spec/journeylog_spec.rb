require 'journeylog'

describe JourneyLog do
    let(:journeylog) { JourneyLog.new(Journey.new) }
    let(:start_station) { double( name: "Euston", zone: 1)}
    let(:end_station) { double( name: "Bank", zone: 1)}
  describe '#start' do
    it 'sets an entry station' do
      journeylog.start(start_station)
      expect(journeylog.journey_class.start).to eq(start_station)
    end
  end
end
