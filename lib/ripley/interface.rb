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
      states = include_states ? states_by_caller : nil
      final_message = formatter.format(message, states)
      logger.send(level, final_message)
    end

    # 'binding of caller' methods

    def states_by_caller
      Tracker.generate_states_by_caller
    end

  end
end
