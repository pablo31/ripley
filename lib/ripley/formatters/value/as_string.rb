module Ripley
  module Formatters
    module Value
      class AsString

        # generate a string identifier for certain variable value

        def format(binding, variable_name, variable_value)
          variable_value.to_s
        end

      end
    end
  end
end
