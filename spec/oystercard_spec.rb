require 'oystercard'

describe Oystercard do
alias_method :card, :subject
  it "Checking balance on card" do
    expect(card).to respond_to(:balance)
  end
end


#card = Card.new
#card.add_money(20)
#card.touch_in(hammersmith)
#card.touch_out(cockfosters)
#card.balance
#station["station name"] returns zone
