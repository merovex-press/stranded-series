#!/usr/bin/env ruby

actions = {
  "series-outline" => "series-bible/01-Overview/10-series-outline.md",
  "setting-overview" => "series-bible/02-Setting/00-Overview.md",
  "format-overview" => "series-bible/01-Overview/01-concept.md",
}

content = File.open('README.md','r').read()

def replace(file_path, tag, content)
  string = File.open(file_path,'r').read()

  string = string.scan(/(<!-- #{tag} -->.*<!-- \/#{tag} -->)/imu).flatten.join("\n")
  return content.gsub(/<!-- #{tag} -->(.*)<!-- \/#{tag} -->/im, string)
end

# Open source files and build array

actions.each do |key, value|
  puts "Replacing #{key} from #{value}."
  content = replace(value, key, content)
end

File.open('Readme-new.md','w').write(content)
# puts content
