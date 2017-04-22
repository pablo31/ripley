module Ripley
  module StateEntryBuilders
    class LocalVariables

      def build_entry(binding, caller_index)
        object = object_name_for(binding, caller_index)
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

      def object_name_for(binding, caller_index)
        "#{binding.receiver.to_s} (call ##{caller_index})"
      end

      def ignore?(object_name)
        return true if object_name.include?('Ripley::')
        return true if object_name.include?('RSpec::')
        return true if object_name.start_with?('main')
        return true if object_name.include?(self.class.name)
        false
      end

    end
  end
end
