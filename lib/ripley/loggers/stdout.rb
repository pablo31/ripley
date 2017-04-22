module Ripley
  module Loggers
    class Stdout

      # logs to stdout

      def fatal(message)
        puts "FATAL #{message}"
      end

      def error(message)
        puts "ERROR #{message}"
      end

      def warn(message)
        puts "WARN #{message}"
      end

      def info(message)
        puts "INFO #{message}"
      end

      def debug(message)
        puts "DEBUG #{message}"
      end

      def trace(message)
        puts "TRACE #{message}"
      end

    end
  end
end
