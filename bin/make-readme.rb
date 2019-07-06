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
  return substitute(tag,content,string)
end
actions.each do |key, value|
  content = replace(value, key, content)
end

## Characters
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
content = substitute("character-section",content,character_section)

## Seasons
seasons = []
Dir.glob("./series-bible/05-Treatments/**/*.md").each { |file|
  begin
    y = YAML.load_file(file)
    y['filename'] = file
    seasons << y if y.is_a? Hash
  rescue
  end
}
# puts seasons.inspect
season_section = "<!-- season-section -->\n| # | Synopsis |\n| :-: | - |\n"
seasons.sort_by { |k| k["season"] }.each do |c|
  season_section << "| **[#{c['season']}](#{c['filename']})** | #{c['synopsis']} |\n"
end
season_section << "<!-- /season-section -->"


content = substitute("season-section",content,season_section)
# puts content

File.open('README.md','w').write(content)
