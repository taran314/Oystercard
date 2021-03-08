require 'oystercard'

describe Oystercard do
alias_method :card, :subject
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
    expect { card.top_up(95) }.to raise_error "Balance exceeds limit of £#{Oystercard::DEFAULT_BALANCE}"
  end

  it "responds to deduct" do
    expect(card).to respond_to(:deduct)
  end

  it "it deducts money from the balance" do
    card.top_up(20)
    card.deduct(10)
    expect(card.balance).to eq 10
  end

  it "knows when it's in_journey" do
    expect(card).not_to be_in_journey
  end

  it "responds to touch in" do
    expect(card).to respond_to(:touch_in)
  end

  it "changes in_journey to true when touch_in" do
    card.touch_in
    expect(card.in_journey?).to eq(true)
  end

  it "responds to touch_out" do
    expect(card).to respond_to(:touch_out)
  end

  it "changes in_journey to false when touch_out" do
    card.touch_in
    card.touch_out
    expect(card.in_journey?).to eq false
  end
end


# card = Card.new
# card.add_money(20)
# card.touch_in(hammersmith)
# card.touch_out(cockfosters)
# card.balance
# station["station name"] returns zone
