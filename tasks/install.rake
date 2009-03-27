namespace :twibblr do
  task :install => [:environment] do
    require File.join(File.dirname(__FILE__), '..', 'install')
  end
  
  task :uninstall do
    require File.join(File.dirname(__FILE__), '..', 'uninstall')
  end
end
