module Ripley
  class Binding < SimpleDelegator

    def line
      eval('__LINE__')
    end

    def file
      eval('__FILE__')
    end

    def description
      "#{file}:#{line}"
    end

    def short_file
      Gem.path.inject(file){ |file_path, gems_path| file_path.gsub(gems_path, '') }
    end

    def short_description
      "#{short_file}:#{line}"
    end

    def object
      receiver
    end

    # override
    def inspect
      "#<#{self.class.name} #{description}>"
    end

    Ripley.ignore_file __FILE__

  end
end
