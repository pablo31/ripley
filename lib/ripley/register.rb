module Ripley
  class Register
    include Singleton

    attr_accessor :ignored_files

    def initialize
      self.ignored_files = Array.new
    end

    def add_ignored_file(file)
      ignored_files << file
    end

    def ignored?(file)
      ignored_files.include?(file)
    end

    Ripley.ignore_file __FILE__

  end
end
