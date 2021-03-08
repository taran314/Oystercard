class Oystercard

attr_accessor :balance
DEFAULT_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Balance exceeds limit of £#{DEFAULT_BALANCE}" if (@balance + amount) > DEFAULT_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
