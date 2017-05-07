module Ripley
  class Register
    include Singleton

    attr_accessor :ignored_files, :binding_filters

    def initialize
      self.ignored_files = Array.new
      self.binding_filters = Array.new
    end

    def add_ignored_file(file)
      ignored_files << file
    end

    def ignore(&block)
      binding_filters << block
    end

    def ignored?(file_or_binding)
      if file_or_binding.is_a?(String)
        ignored_file?(file_or_binding)
      else
        ignored_binding?(file_or_binding)
      end
    end

    def ignored_file?(file)
      ignored_files.include?(file)
    end

    def ignored_binding?(binding)
      binding_filters.any? do |block|
        block.call(binding)
      end
    end

    Ripley.ignore_file __FILE__

  end
end
