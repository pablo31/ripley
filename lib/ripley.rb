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

require 'ripley/formatters/logger/default'
require 'ripley/formatters/object/file_and_line'
require 'ripley/formatters/object/file_name'
require 'ripley/formatters/variable/name'
require 'ripley/formatters/value/as_string'

require 'ripley/state_entry_builders/local_variables'
require 'ripley/interceptor'

module Ripley
  ignore_file(file) # ignore interface.rb
end

require 'ripley/initializers/defaults'
require 'ripley/initializers/ignored_bindings'
