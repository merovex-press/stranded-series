require 'awesome_print'
require 'yaml'

Dir["books/**"].each do |book|
  synopsis = "## #{book.split('-').map{|w| w.capitalize }.join(" ")}\n\n"
  # puts book
  Dir["#{book}/*.md"].each do |file|
    # puts file
    # episode = File.basename(File.dirname(file))
    # episode_heading = episode.split('-').map{|w| w.capitalize }.join(" ")
    # episode_file = "docs/06-Episodes/#{episode}.md"
    section = YAML.load_file(file)
    next if not section['rights'].nil?

    synopsis << <<-EOS
### #{section["title"]}: #{section["location"]} - #{section["time"].capitalize}

#{section["synopsis"]}
EOS
    File.open("docs/06-Episodes/#{File.basename(book)}.md",'w').write(synopsis)

  end
end
