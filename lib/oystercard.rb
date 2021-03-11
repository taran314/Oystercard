require 'journeylog'

class Oystercard

attr_reader :balance, :entry_station, :history, :journey
DEFAULT_BALANCE = 90
MINIMUM_FARE = 1
PENALTY_FARE = 6

  def initialize
    @balance = 0
    @history = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Balance exceeds limit of £#{DEFAULT_BALANCE}" if (@balance + amount) > DEFAULT_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds on card" if @balance < MINIMUM_FARE
    deduct(fare) if @journey.in_journey?
    @journey.add_entry(station)
  end

  def touch_out(station)
    @journey.add_exit(station)
    deduct(fare)
    journey_to_history
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def fare
    return PENALTY_FARE if (@journey.start && @journey.end.nil?) ||
      (@journey.start.nil? && @journey.end)

    MINIMUM_FARE
  end

  def journey_to_history
    @history << @journey
    @journey = Journey.new
  end

end
