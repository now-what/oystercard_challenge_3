# Let's create a new Journey class, it should be responsible for
    # starting a journey, (records entry station, touch in)
    # finishing a journey, (records exit station, touch out)
    # calculating the fare of a journey, (return value that will be used to deduce balance)
    # and returning whether or not the journey is complete.

class Journey

  attr_reader :exit_station, :entry_station

  # intiilaise with start, card
  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
  end

end