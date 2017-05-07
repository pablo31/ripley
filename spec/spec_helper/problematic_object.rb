class ProblematicObject
  include Ripley::Interceptor

  def params
    'no params'
  end

  def a
    raise("Generic error message")
  end

  def b
    variable1 = 'mm'
    raise("Generic error message")
  end

  def c
    chain_method_1
  end

  def chain_method_1
    variable1 = 33
    raise("Generic error message")
  end

  def d
    variable1 = 42
    chain_method_2
  end

  def chain_method_2
    variable1 = 'ww'
    raise("Generic error message")
  end

end
