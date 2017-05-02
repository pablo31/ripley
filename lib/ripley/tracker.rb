module Ripley
  class Tracker
    class << self

      def callers
        binding.callers.map{ |binding| Ripley::Binding.new(binding) }
      end

      def states_by_caller
        callers.map.with_index{ |binding, index| caller_entry(binding, index) }.compact
      end

      def caller_entry(binding, index)
        Ripley.state_entry_builder.build_entry(binding, index)
      end

    end

    Ripley.ignore_file __FILE__

  end
end
