class RipleyableObject

  def params
    'no params'
  end

  def a
    Ripley.error('some message')
  end

  def b
    variable1 = 'mm'
    Ripley.error('some message')
  end

  def c
    chain_method_1
  end

  def chain_method_1
    variable1 = 33
    Ripley.error('some message')
  end

  def d
    variable1 = 42
    chain_method_2
  end

  def chain_method_2
    variable1 = 'ww'
    Ripley.error('some message')
  end

end
