require 'oystercard'

describe Oystercard do
let(:card) { Oystercard.new }
let(:station) { double('Hackney') }
let(:station2) { double('Moorgate') }

  it "Checking balance on card" do
    expect(card).to respond_to(:balance)
  end

  it "responds to top up" do
    expect(card).to respond_to(:top_up)
  end
  it "top_up amends the balance" do
    card.top_up(5)
    expect(card.balance).to eq 5
  end

  it "throws an error if balance exceeds limit" do
    expect { card.top_up(95) }
    .to raise_error "Balance exceeds limit of £#{Oystercard::DEFAULT_BALANCE}"
  end

  it "knows when it's in_journey" do
    expect(card).not_to be_in_journey
  end

  it "responds to touch in" do
    expect(card).to respond_to(:touch_in)
  end

  it "changes in_journey to true when touch_in" do
    card.top_up(Oystercard::MINIMUM_FARE)
    card.touch_in(station)
    expect(card.in_journey?).to eq(true)
  end

  it "responds to touch_out" do
    expect(card).to respond_to(:touch_out)
  end

  it "changes in_journey to false when touch_out" do
    card.top_up(Oystercard::MINIMUM_FARE)
    card.touch_in(station)
    card.touch_out(station2)
    expect(card.in_journey?).to eq false
  end

  it "throws an error if insufficient balance on card" do
    expect { card.touch_in("Hackney") }.to raise_error "Insufficient funds on card"
  end

  it "reduces the balance by the minimum fare on touch_out" do
    card.top_up(Oystercard::MINIMUM_FARE)
    card.touch_in(station)
    expect { card.touch_out(station2) }.to change { card.balance }.by(-Oystercard::MINIMUM_FARE)
  end

  describe '#history' do
    context "when a journey has been made" do
      it "stores one completed journey history" do
        station =  double('Hackney')
        station2 = double('Moorgate')
        card.top_up(20)
        card.touch_in(station)
        card.touch_out(station2)
        expect(card.history[0]).to eq({ entry: station, exit: station2 })
      end
    end

    context "when the card is new" do
      it "returns an empty history when card is new" do
        expect(card.history).to eq []
      end
    end
  end
end
