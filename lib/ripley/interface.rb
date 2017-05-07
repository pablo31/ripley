module Ripley
  module Interface

    # 'logger' methods

    def fatal(message)
      log(:fatal, message, true)
    end

    def error(message)
      log(:error, message, true)
    end

    def warn(message)
      log(:warn, message)
    end

    def info(message)
      log(:info, message)
    end

    def debug(message)
      log(:debug, message)
    end

    def trace(message)
      log(:trace, message)
    end

    def log(level, message, include_states=false)
      states = include_states ? states_by_caller.to_json : nil
      final_message = logger_formatter.format(message, states)
      logger.send(level, final_message)
    end

    # 'binding of caller' methods

    def states_by_caller
      Tracker.states_by_caller
    end

    # error handling methods

    def handle_exception(exception_or_message)
      message = if exception_or_message.is_a?(String)
        exception_or_message
      else
        exception_or_message.message
      end
      error(message)
    end

    def ignore_file(filename)
      Register.instance.add_ignored_file(filename)
    end

    def file
      __FILE__
    end

  end
end
