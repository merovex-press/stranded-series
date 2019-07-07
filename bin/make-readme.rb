#!/usr/bin/env ruby

require 'yaml'

actions = {
  "series-outline" => "series-bible/01-Overview/10-series-outline.md",
  "setting-overview" => "series-bible/02-Setting/00-Overview.md",
  "format-overview" => "series-bible/01-Overview/01-concept.md",
  "concept-overview" => "series-bible/01-Overview/01-concept.md",
}

content = File.open('README.md','r').read()

def buildList(tag, template, list, order, content,section="")
  # section = ""
  list.sort_by { |k| k[order] }.each do |i|
    section << template % i
  end
  return substitute(tag,content,section)
end

def substitute(tag,content,string)
  s = "<!-- %s --><!-- auto-populated -->\n%s<!-- \/%s -->" % [tag, string, tag]
  # puts s.inspect
  return content.gsub(/<!-- #{tag} -->(.*)<!-- \/#{tag} -->/im, s)
end
def replace(file_path, tag, content)
  string = File.open(file_path,'r').read()

  string = string.scan(/<!-- #{tag} -->(.*)<!-- \/#{tag} -->/imu).flatten.join("\n")
  return substitute(tag,content,string)
end
actions.each do |key, value|
  content = replace(value, key, content)
end

## Templates

character_template =<<HERE;

### %{name} (%{role})

%{summary}

Read more about [%{name}](%{filename})

HERE

season_template =<<HERE;
| **[%{season}](%{filename})** | %{synopsis} |
HERE


## Characters
characters = []
Dir.glob("./series-bible/03-Characters/*.md").each { |file|
  begin
    y = YAML.load_file(file)
    characters << {
      :name => y['name'],
      :role => y['role'],
      :order => y['order'],
      :summary => y['summary'],
      :filename => file,
    } if y.is_a? Hash
  rescue
  end
}

## Seasons
seasons = []
Dir.glob("./series-bible/05-Treatments/**/*.md").each { |file|
  begin
    y = YAML.load_file(file)
    seasons << {
      :season => y['season'].to_i,
      :synopsis => y['synopsis'],
      :filename => file,
    } if y.is_a? Hash
  rescue
  end
}
content = buildList(
  "character-section",
  character_template,
  characters,
  :order,
  content
)
content = buildList(
  "season-section",
  season_template,
  seasons,
  :season,
  content,
  "| # | Synopsis |\n| :-: | - |\n"
)

# content = substitute("character-section",content,character_section)
# content = substitute("season-section",content,season_section)
# puts content

puts "Building TOC"
puts content.scan(/^##\s?(.*)\n/iu).flatten.map do |h|
  "* [h](##{h})\n"
end
# puts string

File.open('README-temp.md','w').write(content)
