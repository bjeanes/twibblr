require 'yaml'
require 'twibblr/authentication'

# This ensures that helpers reload in development as well
ActiveSupport::Dependencies.load_once_paths.clear if RAILS_ENV == "development"

module ::Twibblr
  CONFIG = YAML.load_file(File.join(RAILS_ROOT, 'config', 'twibblr.yml'))
end

Twibblr::ROOT = self.directory

# Load plug-in initializers
Dir.chdir(File.join(Twibblr::ROOT, "config", "initializers")) do
  Dir["*.rb"].each { |file| require file }
end