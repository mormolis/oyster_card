class Oystercard
  attr_reader :balance

  CARD_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount if @balance + amount <= CARD_LIMIT
    fail 'Card limit exceeded!' if @balance + amount > CARD_LIMIT
  end
end
