module Ripley
  class Tracker
    class << self

      def generate_states_by_caller
        binding.callers.map.with_index{ |binding, index| caller_entry(binding, index) }.compact
      end

      def caller_entry(binding, index)
        Ripley.state_entry_builder.build_entry(binding, index)
      end

    end
  end
end
