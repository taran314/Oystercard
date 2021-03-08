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
end


# card = Card.new
# card.add_money(20)
# card.touch_in(hammersmith)
# card.touch_out(cockfosters)
# card.balance
# station["station name"] returns zone
