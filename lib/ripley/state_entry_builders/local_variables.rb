module Ripley
  module StateEntryBuilders
    class LocalVariables

      def build_entry(binding, caller_index)
        return nil if Register.instance.ignored?(binding)
        object = object_name_for(binding, caller_index)
        local_variables_hash = list_local_variables(binding)
        [object, local_variables_hash]
      end

      def list_local_variables(binding)
        local_variables = binding.local_variables
        local_variables.inject(Hash.new) do |hash, local_variable|
          value = binding.variable_get(local_variable)
          # next hash if local_variable == :__exception_or_message # ignore Interceptor#raise
          hash.merge(local_variable => value.to_s)
        end
      end

      def object_name_for(binding, caller_index)
        Ripley.object_formatter.format(binding, caller_index)
        # binding.object.class.to_s
        # object = binding.object
        # if object.is_a?(Class) || object.is_a?(Module)
        # end
      end

      Ripley.ignore_file __FILE__

    end
  end
end
