t = ARGV.shift

contents = File.read(t)
scenes = contents.split('#####')
i = -1
puts scenes.count
scenes.each do |s|
  i += 1
  next if i < 4
  puts s.inspect;
  exit
  x = {

  }
  
end
