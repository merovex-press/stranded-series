#!/Users/merovex/.rvm/rubies/ruby-2.4.1/bin/ruby
require 'cmath'
diameter = ARGV[0].to_f # In AU
distance = ARGV[1].to_f # in AU

# puts x.inspect

# (206,265) d / D arcseconds

f = 57.3 * (diameter / distance)
as = (206265 * (diameter / distance)).round(2)
minutes = (f * 60).round;
seconds = ((f.round(0) - f) * 60).round(0)

puts "Diameter in AU: " + diameter.to_s
puts "Distance in AU: " + distance.to_s
puts "answer: #{f.round(5)} or #{minutes}' #{seconds}\" (#{as} arcseconds)"

puts "Compared to Sun:Earth: #{(f / 0.53289).round(2)}"



# puts minutes, seconds
