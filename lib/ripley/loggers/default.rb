module Ripley
  module Formatters
    class Default

      # generates a message from a log message and the app 'states_by_caller'

      def format(message, states=nil)
        return message unless states
        "#{message} #{states}"
      end

    end
  end
end
