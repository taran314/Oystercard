require 'journey'

describe Journey do
  let(:journey) { Journey.new }
  describe '#in_journey?' do
    it "starts out not in journey" do
        expect(journey).not_to be_in_journey
    end
  end
end