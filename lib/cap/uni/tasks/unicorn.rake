module Capistrano
  class FileNotFound < StandardError
  end
end


namespace :unicorn do

  desc "Start Unicorn server"
  task :start do
    on roles(:all) do
      if test "[ -S #{fetch(:unicorn_pid)} ]" then
        info "Unicorn PID was found.  Unicorn is already running, or it might be a stale pid"
        info "If you really want to restart it, use unicorn:restart.  I'm giving up now"
      else
        execute "cd #{current_path}; bundle exec unicorn -c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
      end
    end
  end

  desc "Kill Unicorn server"
  task :stop do
    on roles(:all) do
     if test "[ -S #{fetch(:unicorn_pid)} ]" then
       execute "kill $(cat #{fetch(:unicorn_pid)})"
     end
    end
  end

  desc "Restart Unicorn server"
  task :restart do
    on roles(:all) do
      invoke 'unicorn:stop'
      invoke 'unicorn:start'
    end
  end
end

