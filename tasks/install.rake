namespace :twibblr do
  task :install do
    # From railscasts #149
    system "rsync -ruv vendor/plugins/twibblr/db/migrate db"
    system "rsync -ruv vendor/plugins/twibblr/public public/twibblr"
  end
end
