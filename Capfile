load 'deploy' if respond_to?(:namespace) #cap2 differentiator
# Uncomment if you are using Rails' asset pipeline
    load 'deploy/assets'
Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy' # remove this line to skip loading any of the default tasks

require "rvm/capistrano"	#Load RVM's capistrano plugin
set :rvm_ruby_string, 'some-ruby'
