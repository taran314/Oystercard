require 'station'

describe Station do

  let(:station) { Station.new("Euston", 1) }

  it 'stores a name' do
    expect(station.name).to eq("Euston")
  end

  it 'stores a zone' do
    expect(station.zone).to eq(1)
  end

end