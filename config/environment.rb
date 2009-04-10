# This ensures that helpers reload in development as well
ActiveSupport::Dependencies.load_once_paths.clear if RAILS_ENV == "development"

# Get the configuration object
config = Rails.configuration

# We can do gem dependencies like in Rails' evironment.rb
# because load_gems is called twice, once before load_plugins
# and once after to get plugin dependencies
config.gem "ultraviolet", :lib => "uv"

# Load plug-in initializers
Dir.chdir(File.join(Twibblr::ROOT, "config", "initializers")) do
  Dir["*.rb"].each { |file| load(file) }
end