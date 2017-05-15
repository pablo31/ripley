module Ripley
  class Tracker
    include Singleton

    def self.make_class_method(method_name)
      define_singleton_method(method_name){ instance.send(method_name) }
    end

    def callers
      binding.callers.map{ |binding| Ripley::Binding.new(binding) }
    end

    def states_by_caller
      callers.map.with_index{ |binding, index| caller_entry(binding, index) }.compact
    end

    def caller_entry(binding, index)
      Ripley.state_entry_builder.build_entry(binding, index)
    end

    make_class_method :callers
    make_class_method :states_by_caller

    Ripley.ignore_file __FILE__

  end
end
