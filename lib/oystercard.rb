class Oystercard
  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail "Card limit #{MAXIMUM_BALANCE} exceeded!" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    fail "Card balance below minimum of #{MINIMUM_BALANCE}!" if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    journey_history << { entry_station: @entry_station, exit_station: exit_station }
    @entry_station = nil
  end

  def journey_history
    @journey_history
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
