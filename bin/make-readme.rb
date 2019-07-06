#!/usr/bin/env ruby

require 'yaml'

actions = {
  "series-outline" => "series-bible/01-Overview/10-series-outline.md",
  "setting-overview" => "series-bible/02-Setting/00-Overview.md",
  "format-overview" => "series-bible/01-Overview/01-concept.md",
  "concept-overview" => "series-bible/01-Overview/01-concept.md",
}

content = File.open('README.md','r').read()

def substitute(tag,content,string)
  return content.gsub(/<!-- #{tag} -->(.*)<!-- \/#{tag} -->/im, string)
end
def replace(file_path, tag, content)
  string = File.open(file_path,'r').read()

  string = string.scan(/(<!-- #{tag} -->.*<!-- \/#{tag} -->)/imu).flatten.join("\n")
  # return content.gsub(/<!-- #{tag} -->(.*)<!-- \/#{tag} -->/im, string)
  return substitute(tag,content,string)
end

# Open source files and build array

actions.each do |key, value|
  # puts "Replacing #{key} from #{value}."
  content = replace(value, key, content)
end


characters = []

Dir.glob("./series-bible/03-Characters/*.md").each { |file|
  begin
    y = YAML.load_file(file)
    characters << y if y.is_a? Hash
  rescue
  end
}

character_section = "<!-- character-section -->\n"
characters.sort_by { |k| k["order"] }.each do |c|
  character_section << "### #{c['name']} (#{c['role']})\n\n#{c['summary']}\n\n"
end
character_section << "<!-- /character-section -->"

# puts character_section
content = substitute("character-section",content,character_section)
# puts characters.inspect
# puts content

File.open('README.md','w').write(content)
