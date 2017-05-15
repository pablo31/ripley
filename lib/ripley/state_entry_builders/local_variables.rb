module Ripley
  module StateEntryBuilders
    class LocalVariables

      def build_entry(binding, caller_index)
        return nil if Register.instance.ignored?(binding)
        object = Ripley.object_formatter.format(binding, caller_index)
        local_variables_hash = list_local_variables(binding)
        [object, local_variables_hash]
      end

      def list_local_variables(binding)
        local_variables = binding.local_variables
        local_variables.inject(Hash.new) do |hash, local_variable|
          key = Ripley.variable_formatter.format(binding, local_variable)
          local_value = binding.variable_get(local_variable)
          value = Ripley.value_formatter.format(binding, local_variable, local_value)
          hash.merge(key => value)
        end
      end

      Ripley.ignore_file __FILE__

    end
  end
end
