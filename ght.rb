#!/Users/merovex/.rvm/rubies/ruby-2.4.1/bin/ruby

file = ARGV[0]

puts file.inspect

lines = `ghtoc #{file}`.split("\n")
lines.pop
toc = lines.join("\n").gsub("   *", "*").gsub("* [Table of Contents](#table-of-contents)\n", "")

contents = File.read(file)
contents.gsub!(/<!-- contents -->.*?<!-- \/contents -->/m,"<!-- contents -->#{toc}<!-- /contents -->")

f = File.open(file,'w')
f.write(contents)
f.close
