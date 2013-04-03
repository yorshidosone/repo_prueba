set :application, "facturas"
set :repository,  "git@github.com:yorshidosone/repo_prueba.git"

set :branch, "master"
set :domain, "dev.aggerosoluttions.com"

#Deploy from your local Git repo by cloning and uploading a tarball
set :scm, :git

set :rails_env, "production"
set :user, "jacevedo"
set :scm_username, 'yorshidosone'

set :stages, ["staging", "production"]
set :default_stage, "staging"

set :deploy_via, :remote_cache

set :deploy_to, "/home/jacevedo/#{application}"
set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "dev.aggerosolutions.com"                          # Your HTTP server, Apache/etc
role :app, "dev.aggerosolutions.com"                          # This may be the same as your `Web` server
role :db,  "dev.aggerosolutions.com", :primary => true # This is where Rails migrations will run

after "deploy:migrations", "deploy:cleanup"
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
  # task :start do ; end
  # task :stop do ; end
  # task :restart, :roles => :app, :except => { :no_release => true } do
    # run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  # end
# end