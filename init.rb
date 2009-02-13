# We want to reload all the controllers, helpers, and 
# models if we are in development mode:
ActiveSupport::Dependencies.load_once_paths.clear if RAILS_ENV == "development"

::TWIBBLR_ROOT = File.expand_path(File.dirname(__FILE__))

# Load plug-in initializers
Dir.chdir(File.join(::TWIBBLR_ROOT, "config", "initializers")) do
  Dir["*.rb"].each { |file| require file }
end