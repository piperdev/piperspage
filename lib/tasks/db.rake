namespace :db do
  task :go => [:migrate, "test:prepare"]
  task :fix => [:drop, :create, :go]
end
