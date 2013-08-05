module Capistrano
  class FileNotFound < StandardError
  end
end


namespace :unicorn do

  desc "Start Unicorn server"
  task :start do
    on roles(:all) do
     execute "#{fetch(:unicorn_binary)} -c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
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

