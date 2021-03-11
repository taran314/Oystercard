class Oystercard

attr_reader :balance, :entry_station, :history
DEFAULT_BALANCE = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @history = []
    @journey = { entry: nil, exit: nil }
  end

  def top_up(amount)
    raise "Balance exceeds limit of £#{DEFAULT_BALANCE}" if (@balance + amount) > DEFAULT_BALANCE
    @balance += amount
  end

  def in_journey?
    @journey[:entry] != nil
  end

  def touch_in(station)
    raise "Insufficient funds on card" if @balance < MINIMUM_FARE
    @journey[:entry] = station
  end

  def touch_out(station)
    @balance -= MINIMUM_FARE
    @journey[:exit] = station
    journey_to_history
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def journey_to_history
    @history << @journey
    @journey = { entry: nil, exit: nil }
  end

end
