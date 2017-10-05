class Journey

  def start_at(station)
    @entry_station = station
  end

  def end_at(station)
    @exit_station = station
  end

  def in_journey?
    !!entry_station && !exit_station
  end

  private 

  attr_reader :entry_station, :exit_station

end