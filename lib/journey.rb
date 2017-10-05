class Journey

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
  end

  def in_journey?
    !!entry_station && !exit_station
  end

  private 

  attr_reader :entry_station, :exit_station

end