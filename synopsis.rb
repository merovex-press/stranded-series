require 'awesome_print'
require 'yaml'

Dir["books/**"].each do |book|
  synopsis = "## #{File.basename(book).split('-').map{|w| w.capitalize }.join(" ")}\n\n"
  
  Dir["#{book}/*.md"].each do |file|
    next if file.include?("metadata")
    section = YAML.load_file(file)

    synopsis << <<-EOS
#### #{section["title"]}: #{section["location"]} - #{section["time"].capitalize}

#{section["synopsis"]}
EOS
    File.open("docs/06-Episodes/#{File.basename(book)}.md",'w').write(synopsis)

  end
end
