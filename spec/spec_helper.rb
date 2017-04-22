require 'rspec'
require 'pry'

require 'ripley'

require_relative 'spec_helper/trackeable_object'
require_relative 'spec_helper/ripleyable_object'
require_relative 'spec_helper/custom_state_entry_builder'

Ripley.state_entry_builder = CustomStateEntryBuilder.new
