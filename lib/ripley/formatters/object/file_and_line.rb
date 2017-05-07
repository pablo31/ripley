module Ripley
  module Formatters
    module Object
      class FileAndLine

        # generate an object string identifier for the call stack that is showed to the user

        def format(binding, caller_index=nil)
          binding.short_file
        end

      end
    end
  end
end
