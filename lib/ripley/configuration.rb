module Ripley
  module Configuration

    attr_accessor :logger
    attr_accessor :logger_formatter, :object_formatter, :variable_formatter, :value_formatter

    def configure(&block)
      block.call(self)
      self
    end

    def track_all_exceptions!
      require 'ripley/ext'
    end

  end
end
