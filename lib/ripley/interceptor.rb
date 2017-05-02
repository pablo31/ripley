module Ripley
  module Interceptor

    def raise(__exception_or_message)
      Ripley.handle_exception(__exception_or_message)
      super
    end

    Ripley.ignore_file __FILE__

  end
end
