namespace :db do
  task :go => [:migrate, "test:prepare"]
  task :fix => [:drop, :create, :migrate, :seed, "test:prepare"]
end
