require "oystercard"

class Journey

  attr_reader :start, :end

  def initialize
    @start = nil
    @end = nil
  end

  def add_entry(station)
    @start = station
  end

  def add_exit(station)
    @end = station
  end

  def in_journey?
    @start != nil
  end

end