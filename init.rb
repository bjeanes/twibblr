# We want to reload all the controllers, helpers, and 
# models if we are in development mode:
ActiveSupport::Dependencies.load_once_paths.clear if RAILS_ENV == "development"

module Twibblr
  ROOT = File.expand_path(File.dirname(__FILE__))  
end

# Load plug-in initializers
Dir.chdir(File.join(Twibblr::ROOT, "config", "initializers")) do
  Dir["*.rb"].each { |file| require file }
end