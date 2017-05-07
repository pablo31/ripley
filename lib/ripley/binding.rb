module Ripley
  class Binding < SimpleDelegator

    # file & line

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

    # object

    def object
      receiver
    end

    # variables

    def local_variables
      eval('local_variables')
    end

    def variable_get(variable_name)
      eval(variable_name.to_s)
    end

    # misc

    # override
    def inspect
      "#<#{self.class.name} #{description}>"
    end

    Ripley.ignore_file __FILE__

  end
end
