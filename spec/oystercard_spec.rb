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
end


#card = Card.new
#card.add_money(20)
#card.touch_in(hammersmith)
#card.touch_out(cockfosters)
#card.balance
#station["station name"] returns zone
