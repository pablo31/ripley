require 'json'
require 'singleton'
require 'binding_of_caller'

require "ripley/version"

require 'ripley/configuration'
require 'ripley/interface'

# require 'ripley/where'

module Ripley
  extend Interface
  extend Configuration
end

require 'ripley/register'
require 'ripley/binding'
require 'ripley/tracker'

require 'ripley/loggers/default'
require 'ripley/loggers/stdout'
require 'ripley/formatters/default'
require 'ripley/state_entry_builders/local_variables'
require 'ripley/interceptor'

module Ripley
  self.logger = Loggers::Default.new
  self.formatter = Formatters::Default.new
  self.state_entry_builder = StateEntryBuilders::LocalVariables.new
  ignore_file(file) # ignore interface.rb
end
