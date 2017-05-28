require 'rspec'
require 'pry'

require 'ripley'

require_relative 'spec_helper/trackeable_object'
require_relative 'spec_helper/ripleyable_object'
require_relative 'spec_helper/problematic_object'

Ripley.object_formatter = Ripley::Formatters::Object::FileName.new
