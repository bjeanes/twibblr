TWIBBLR_ROOT = File.expand_path(File.join(File.dirname(__FILE__),'..','..','..'))

def db_migrate_path(root)
  File.join(root, "db", "migrate")
end

def migrations(path)
  Dir.chdir(path) do
    Dir["*.rb"].sort
  end
end

namespace :plugin do
  namespace :twibblr do
    desc "Copy Twibblr migrations to db/migrate"
    task :copy_migrations do
      app_migrate_path    = db_migrate_path(RAILS_ROOT)
      plugin_migrate_path = db_migrate_path(TWIBBLR_ROOT)
      
      app_migrations    = migrations(app_migrate_path)
      plugin_migrations = migrations(plugin_migrate_path)
      
      time = Time.now
      
      plugin_migrations.each do |migration|
        migration_name = migration.match(/\d+_(.+)\.rb/)[1].to_s
        
        if app_migrations.grep(Regexp.new("#{migration_name}\.rb$")).empty?
          new_migration = "#{(time+=1).to_s(:number)}_#{migration_name}.rb"
          source        = File.join(plugin_migrate_path, migration)
          destination   = File.join(app_migrate_path,    new_migration)
          puts "Installing #{migration} into main Rails application"
          FileUtils.cp(source, destination)
        end
      end      
    end
  end
end