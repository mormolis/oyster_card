class Journey

  MINIMUM_FARE = 1
  MAXIMUM_FARE = 6

  def start(station)
    @entry_station = station
    @complete = false
  end

  def end(station = nil)
    @exit_station = station
    @complete = true
  end

  def complete?
    @complete
  end

  def fare
    entry_station && exit_station ? MINIMUM_FARE : MAXIMUM_FARE
  end

  private 

  attr_reader :entry_station, :exit_station

end