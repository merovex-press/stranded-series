#!/usr/bin/env ruby

require 'yaml'

def buildList(tag, template, list, order, content,section="")
  # section = ""
  list.sort_by { |k| k[order] }.each do |i|
    section << template % i
  end
  return substitute(tag,content,section)
end
def substitute(tag,content,string)
  s = "<!-- %s --><!-- auto-populated -->\n%s<!-- \/%s -->" % [tag, string, tag]
  return content.gsub(/<!-- #{tag} -->(.*)<!-- \/#{tag} -->/im, s)
end
def replace(file_path, tag, content)
  string = File.open(file_path,'r').read()

  string = string.scan(/<!-- #{tag} -->(.*)<!-- \/#{tag} -->/imu).flatten.join("\n")
  return substitute(tag,content,string)
end

content = File.open('README.md','r').read()

# ============================================
## Templates
character_template =<<HERE;

### %{name} (%{role})

%{summary}

Read more about [%{name}](%{filename})

HERE

toc_template = "%s* [%s](#%s)\n"

# ============================================
## Perform series of static string substitutions.
actions = {
  "series-outline"   => "series-bible/01-Overview/10-series-outline.md",
  "setting-overview" => "series-bible/02-Setting/00-Overview.md",
  "format-overview"  => "series-bible/01-Overview/01-concept.md",
  "concept-overview" => "series-bible/01-Overview/01-concept.md",
}.each do |key, value|
  content = replace(value, key, content)
end

# ============================================
## Characters
characters = []
Dir.glob("./series-bible/**/*.md").each { |file|
  begin
    y = YAML.load_file(file)
    next unless y['type'] == 'major-character'
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

# ============================================
## Seasons
seasons = []
Dir.glob("./series-bible/**/*.md").each { |file|
  begin
    y = YAML.load_file(file)
    next unless y['type'] == 'season'
    seasons << {
      :name => y['name'],
      :role => y['role'],
      :order => y['order'],
      :summary => y['summary'],
      :filename => file,
    } if y.is_a? Hash
  rescue
  end
}
# ============================================
## Locations
locations = []
Dir.glob("./series-bible/**/*.md").each { |file|
  begin
    y = YAML.load_file(file)
    next unless y['type'] == 'location'
    locations << {
      :name => y['name'],
      :role => y['role'],
      :order => y['order'],
      :summary => y['summary'],
      :filename => file,
    } if y.is_a? Hash
  rescue
  end
}

# ============================================
## Troopes
tropes = []
Dir.glob("./series-bible/**/*.md").each { |file|
  begin
    y = YAML.load_file(file)
    next unless y['type'] == 'trope'
    tropes << {
      :name => y['name'],
      :role => y['role'],
      :order => y['order'],
      :summary => y['summary'],
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
  "location-section",
  "* **[%{name}](%{filename}).** %{summary}\n",
  locations,
  :name,
  content
)
content = buildList(
  "trope-section",
  "* **[%{name}](%{filename}).** %{summary}\n",
  tropes,
  :name,
  content
)
content = buildList(
  "season-section",
  "| **[%{order}](%{filename})** | %{summary} |\n",
  seasons,
  :order,
  content,
  "| # | Synopsis |\n| :-: | - |\n"
)

# Building Table of Contents
toc = ""
content.scan(/^##\s?(.*)\n/iu).flatten.each do |header|
  next if header == 'Contents'
  indent = ""
  header.gsub!(/#\s?+/) { indent += "  "; "" }
  anchor = header.downcase.gsub(/\W+/,'-').chomp('-')
  toc << toc_template % [indent,header,anchor]
end
content = substitute("toc",content,toc)

target = 'README.md'
# target = 'README-temp.md'

File.open(target,'w').write(content)
