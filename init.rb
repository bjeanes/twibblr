require 'yaml'

module ::Twibblr
  begin
    CONFIG = YAML.load_file(File.join(RAILS_ROOT, 'config', 'twibblr.yml'))
  rescue Errno::ENOENT => e
    abort "Please run `rake twibblr:install` to setup the necessary files for Twibblr"
  end
end

Twibblr::ROOT = self.directory

require File.join(File.dirname(__FILE__), "config", "environment")