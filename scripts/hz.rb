#!/Users/merovex/.rvm/rubies/ruby-2.4.1/bin/ruby

l = ARGV[0].to_f

inner = Math.sqrt(l / 1.1).round(2)
outer = Math.sqrt(l / 0.53).round(2)

puts "Inner: #{inner}\tOuter #{outer}"
