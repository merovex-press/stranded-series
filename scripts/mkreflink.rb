#!/usr/bin/env ruby

LETTERS = [(0..9), ('a'..'z'), ('A'..'Z')].map(&:to_a).flatten

def mkHash
  Array.new(8) { LETTERS.sample }.join
end
reflinks = {}
target = ARGV.shift
contents = File.open(target,'r').read

## Replace inline links with reference links
contents.gsub!(/\]\((.*?)\)/) {
  url = "#{$1}"
  if reflinks.key(url)
    ref = reflinks.key(url)
  else
    ref = mkHash
    reflinks[ref] = url
  end
  "][#{ref}]"
}
## Add in the reference links at document end.
contents << "\n\n<!-- Reference URLs -->\n"
reflinks.each do |ref,url|
  contents << "[#{ref}]: #{url} \n"
end

File.open(target,'w').write(contents)
