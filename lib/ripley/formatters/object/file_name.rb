module Ripley
  module Formatters
    module Object
      class FileName

        # generate an object string identifier for the call stack that is showed to the user

        def format(binding, caller_index=nil)
          binding.short_file.split('/').last.gsub(/\..+/, '')
        end

      end
    end
  end
end
