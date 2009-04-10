require 'yaml'

# This ensures that helpers reload in development as well
ActiveSupport::Dependencies.load_once_paths.clear if RAILS_ENV == "development"

module ::Twibblr
  begin
    CONFIG = YAML.load_file(File.join(RAILS_ROOT, 'config', 'twibblr.yml'))
  rescue Errno::ENOENT => e
    abort "Please run `rake twibblr:install` to setup the necessary files for Twibblr"
  end
end

Twibblr::ROOT = self.directory

# Load plug-in initializers
Dir.chdir(File.join(Twibblr::ROOT, "config", "initializers")) do
  Dir["*.rb"].each { |file| require file }
end