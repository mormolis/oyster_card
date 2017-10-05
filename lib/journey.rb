require_relative './station'
class Journey

  MINIMUM_FARE = 1
  MAXIMUM_FARE = 6
  attr_reader :fare
 

  def start(station)
    @entry_station = station
    @fare = calculate_fare
  end

  def end(station)
    @exit_station = station
    @fare = calculate_fare
  end


  def calculate_fare
    entry_station && exit_station ? MINIMUM_FARE : MAXIMUM_FARE
  end

  def to_s
    "#{@entry_station} - #{@exit_station}"
  end

  private 

  attr_reader :entry_station, :exit_station
 

end