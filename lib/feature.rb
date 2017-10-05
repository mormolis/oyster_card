require_relative './journey'
require_relative './oystercard'
require_relative './station'
def print_hist(card)
  puts "history :" 
  card.journey_history.each{ |i| puts i}
end

st1 = Station.new(name: "Algate East", zone: 2)
st2 = Station.new(name: "Deptford", zone: 2)
card = Oystercard.new
card.top_up(30)
puts "oysters balance: £#{card.balance}"
card.touch_in(st1)
puts "touched in - oysters balance: £#{card.balance}"
card.touch_out(st2)
puts "touched out - oysters balance: £#{card.balance}"
print_hist(card)
puts "\n\n#################\n\n"
card.touch_in(st1)
puts "touched in - oysters balance: £#{card.balance}"
card.touch_in(st2)
puts "touched in - oysters balance: £#{card.balance}"
print_hist(card)

puts "\n\n#################\n\n"
card.touch_out(st1)
puts "touched in - oysters balance: £#{card.balance}"
print_hist(card)
