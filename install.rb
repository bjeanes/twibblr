require 'erb'

plugin_path = File.expand_path(File.dirname(__FILE__))

puts "Installing migrations"
system "rsync -ru #{plugin_path}/db/migrate db"

puts "Installing static files"
system "rsync -ru --delete #{plugin_path}/public/ public/twibblr"

puts "Installing twibblr config file"
raw_config = File.read("#{plugin_path}/config/twibblr.yml.erb") 
erb_config = ERB.new(raw_config).result
File.open(File.join(RAILS_ROOT, 'config', 'twibblr.yml'), 'w') { |f| f.write(erb_config) }
