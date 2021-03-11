require 'journey'

class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class)

    @journey_class = journey_class

  end

  def start(station)
    @journey_class.add_entry(station)
  end
  
end
