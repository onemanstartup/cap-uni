## Cap::Uni

Unicorn specific Capistrano tasks

Tested with rails 4.0 and Capistrano 3.0

### Installation

Add this line to your application's Gemfile:

    gem 'cap-uni'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cap-uni

### Usage

Add the following to your project files:

Capfile  
  
    require 'cap/uni/unicorn'  
    after :updated, 'unicorn:restart'  


config/deploy.rb  

    # full path to the unicorn binary after deployment  
    set :unicorn_binary, "#{current_path}/bin/unicorn"  
    
    # path to the PID file after deployment  
    set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"  

config/deploy/%unicorn config file%.rb  

    # this might be different for dev/test/prod, that's why  
    # it should be in the environment file  
    set :unicorn_config, "#{current_path}/config/unicorn/production.rb"  

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
