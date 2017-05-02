module Ripley
  module Configuration

    attr_accessor :logger, :formatter, :state_entry_builder

    def configure(&block)
      block.call(self)
      self
    end

    def track_all_exceptions!
      require 'ripley/ext'
    end

  end
end
