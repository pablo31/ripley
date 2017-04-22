module Ripley
  module Configuration

    attr_accessor :logger, :formatter, :state_entry_builder

    def configure(&block)
      block.call(self)
      self
    end

  end
end
