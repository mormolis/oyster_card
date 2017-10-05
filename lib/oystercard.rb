require_relative './journey'
class Oystercard
  attr_reader :balance, :entry_station, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  # MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail "Card limit #{MAXIMUM_BALANCE} exceeded!" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Card balance below minimum of #{MINIMUM_BALANCE}!" if @balance < MINIMUM_BALANCE
    create_journey
    deduct(journey.fare)
    journey.start(station)
  end

  def touch_out(station)
    deduct(journey.fare)
    journey.end(station)
    @journey_history << journey
  end

  private

  attr_reader :journey_history

  def deduct(amount)
    @balance -= amount
  end

  def create_journey
    @journey = Journey.new
  end

end
