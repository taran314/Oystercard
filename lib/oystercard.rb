class Oystercard

attr_accessor :balance, :entry_station
DEFAULT_BALANCE = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Balance exceeds limit of £#{DEFAULT_BALANCE}" if (@balance + amount) > DEFAULT_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station != nil ? true : false
  end

  def touch_in(station)
    raise "Insufficient funds on card" if @balance < MINIMUM_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    @in_journey = false
    @balance -= MINIMUM_FARE
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
