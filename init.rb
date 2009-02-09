# We want to reload all the controllers, helpers, and 
# models if we are in development mode:
ActiveSupport::Dependencies.load_once_paths.clear if RAILS_ENV == "development"