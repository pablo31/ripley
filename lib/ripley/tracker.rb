module Ripley
  class Tracker
    class << self

      def generate_states_by_caller
        binding.callers.map.with_index{ |binding, index| caller_entry(binding, index) }.compact
      end

      def caller_entry(binding, index)
        object = object_name_for(binding, index)
        return nil if ignore?(object)
        local_variables_hash = list_local_variables(binding)
        [object, local_variables_hash]
      end

      def list_local_variables(binding)
        local_variables_names = binding.eval('local_variables')
        local_variables_names.inject(Hash.new) do |hash, local_variable_name|
          local_variable_value = binding.eval(local_variable_name.to_s)
          local_variable_value = local_variable_value.to_s
          hash.merge(local_variable_name => local_variable_value)
        end
      end

      def object_name_for(binding, index)
        "#{binding.receiver.to_s} #{index}"
      end

      def ignore?(object_name)
        return true if object_name.include?('Ripley::')
        return true if object_name.include?('RSpec::')
        return true if object_name.start_with?('main')
        false
      end

    end
  end
end
