module Capistrano
  class FileNotFound < StandardError
  end
end


namespace :unicorn do

  desc "Start Unicorn server"
  task :start do
    on roles(:all) do
      invoke 'unicorn:stop'
      execute "cd #{current_path}; bundle exec unicorn -c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
    end
  end

  desc "Kill Unicorn server"
  task :stop do
    on roles(:all) do
      execute "if [ -e #{fetch(:unicorn_pid)} ]; then kill $(cat #{fetch(:unicorn_pid)}); fi"
    end
  end
  
  # this really does the same thing as :start"
  desc "Restart Unicorn server"
  task :restart do
    on roles(:all) do
      invoke 'unicorn:start'
    end
  end
end

