# Include hook code here
require 'twibblr'

RAILS_DEFAULT_LOGGER.debug ActiveSupport::Dependencies.load_once_paths.join("\n")

ActiveSupport::Dependencies.load_once_paths.clear