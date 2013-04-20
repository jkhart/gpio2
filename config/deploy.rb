require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "gpio2"

set :repository,  "git@github.com:jkhart/gpio2.git"
set :scm, :git

set :deploy_to, "/home/pi/applications/#{application}"
set :deploy_via, :remote_cache
set :user, "pi"
set :use_sudo, false
set :normalize_asset_timestamps, false

set :rvm_ruby_string, "1.9.3-p392"
set :rvm_bin_path, "/home/#{user}/.rvm/bin/"

role :web, "192.168.1.110"
role :app, "192.168.1.110"
role :db,  "192.168.1.110", :primary => true

namespace :deploy do
  task :start do
    run "cd #{current_path} && bundle exec rails s production -d -P #{shared_path}/pids/server.pid"
  end
  task :stop do
    pid_file = "#{shared_path}/pids/server.pid"
    pid = File.read(pid_file).to_i
    Process.kill 9, pid
    File.delete pid_file
    #run "ps aux | grep 'rails s' | awk '{ print $2 }'"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end
after "deploy:restart", "deploy:cleanup"
