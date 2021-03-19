require 'oystercard'

describe Oystercard do
let(:card) { Oystercard.new }
let(:station) { Station.new("Euston", 1) }
let(:station2) { Station.new("Waterloo", 1) }

  describe '#top_up' do
    it "top_up amends the balance" do
      card.top_up(5)
      expect(card.balance).to eq 5
    end
  
    it "throws an error if balance exceeds limit" do
      expect { card.top_up(95) }
      .to raise_error "Balance exceeds limit of £#{Oystercard::DEFAULT_BALANCE}"
    end
  end
  
  describe '#touch_in' do
    it "responds to touch in" do
      expect(card).to respond_to(:touch_in)
    end
  
    it "changes in_journey to true when touch_in" do
      card.top_up(Oystercard::MINIMUM_FARE)
      card.touch_in(station)
      expect(card.journey.in_journey?).to eq(true)
    end

    it "throws an error if insufficient balance on card" do
      expect { card.touch_in(station) }.to raise_error "Insufficient funds on card"
    end
  
  end
  
  describe '#touch_out' do
    it "responds to touch_out" do
      expect(card).to respond_to(:touch_out)
    end

    it "changes in_journey to false when touch_out" do
      card.top_up(Oystercard::MINIMUM_FARE)
      card.touch_in(station)
      card.touch_out(station2)
      expect(card.journey.in_journey?).to eq false
    end

    it "reduces the balance by the minimum fare on touch_out" do
      card.top_up(Oystercard::MINIMUM_FARE)
      card.touch_in(station)
      expect { card.touch_out(station2) }
      .to change { card.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end

  describe '#fare' do
    context 'when card touched in and out' do
      it 'deducts the MINIMUM_FARE from balance' do
        card.top_up(20)
        card.touch_in(station)
        expect { card.touch_out(station2) }
        .to change{ card.balance }.by -Oystercard::MINIMUM_FARE
      end
    end
    context 'when card touched in but not out' do
      it 'deducts the PENALTY_FARE from balance' do
        card.top_up(20)
        card.touch_in(station)
        expect { card.touch_in(station2) }.to change{ card.balance}
        .by -Oystercard::PENALTY_FARE
      end
    end
    context 'when card not touched in but touched out' do
      it 'deducts the PENALTY_FARE from balance' do
        card.top_up(20)
        expect { card.touch_out(station) }.to change{ card.balance}
        .by -Oystercard::PENALTY_FARE
      end
    end
  end

  describe '#history' do
    context "when a journey has been made" do
      it "stores one completed journey history" do
        card.top_up(20)
        card.touch_in(station)
        card.touch_out(station2)
        expect(card.history[0]).to be_a(Journey)
      end
    end



    context "when the card is new" do
      it "returns an empty history when card is new" do
        expect(card.history).to eq []
      end
    end
  end
end
