# Encoding: utf-8
require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'
require 'chef/application'

::LOG_LEVEL = :fatal

::CHEFSPEC_OPTS = {
  log_level: ::LOG_LEVEL
}

def stub_resources
end

at_exit { ChefSpec::Coverage.report! }
