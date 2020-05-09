require 'yaml'
require 'awesome_print'
@pov = {

}
@meta = {
  "characters" => {
    "doe" => []
  },
  "objects" => {},
  "events" => {},
  "locations" => {}
}
# ap @meta
# build object index from Book directory
Dir["books/**/*.md"].each do |section|
  thing = YAML.load_file(section)
  next if thing["pov"].nil?
  @pov[thing["pov"]] = [] if @pov[thing["pov"]].nil?
  @pov[thing["pov"]] << section

  %w(characters objects events).each do |k|
    thing[k].each do |l|
      @meta[k][l] = [] if @meta[k][l].nil?
      @meta[k][l] << section
    end
  end
  ap thing
end
# ap @meta
@meta.keys.each do |chapter|
  dir = "docs/Series-Data/#{chapter.capitalize}/"
  # puts dir
  # ap @meta[chapter].keys
  @meta[chapter].keys.each do |k|
    file = "#{dir}#{k}.md"
    puts file
    x = @meta[chapter][k].join("\n* ")
    contents = mentions = "<!-- mentions -->\n* #{x}\n<!-- /mentions -->\n"
    povs = ""
    unless @pov[k].nil?
      povs = "<!-- povs -->\n* #{@pov[k].join("\n* ")}\n<!-- /povs -->\n"
    end
    contents = File.open(file).read if File.exist?(file)
    contents.gsub!(/<!-- mentions -->.*?<!-- \/mentions -->/m, mentions)
    contents.gsub!(/<!-- povs -->.*?<!-- \/povs -->/m, povs)
    contents += povs unless povs.include?("-- pov --")
    File.open(file,'w').write(contents)
  end
end

# Find alias-referenced items in Docs
# Characters, show mentions & POV
# Events,
