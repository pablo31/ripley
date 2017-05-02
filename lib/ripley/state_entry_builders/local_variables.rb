module Ripley
  module StateEntryBuilders
    class LocalVariables

      def build_entry(binding, caller_index)
        return nil if ignore?(binding)
        object = object_name_for(binding, caller_index)
        local_variables_hash = list_local_variables(binding)
        [object, local_variables_hash]
      end

      def list_local_variables(binding)
        local_variables_names = binding.eval('local_variables')
        local_variables_names.inject(Hash.new) do |hash, local_variable_name|
          local_variable_value = binding.eval(local_variable_name.to_s)
          local_variable_value = local_variable_value.to_s
          # next hash if local_variable_name == :__exception_or_message # ignore Interceptor#raise
          hash.merge(local_variable_name => local_variable_value)
        end
      end

      def object_name_for(binding, caller_index)
        binding.short_description
        # binding.object.class.to_s
        # object = binding.object
        # if object.is_a?(Class) || object.is_a?(Module)
        # end
      end

      def ignore?(binding)
        return true if Register.instance.ignored?(binding.file)
        # return false if binding.object.respond_to?(:ripleyable?) && binding.object.ripleyable?
        return true if binding.short_file.start_with?('/gems/ripley')
        # return true if binding.file.include?('/ripley/')
        return true if binding.file.include?('rspec')
        return true if binding.file.include?('ruby_executable_hooks')
        false
      end

      Ripley.ignore_file __FILE__

    end
  end
end
