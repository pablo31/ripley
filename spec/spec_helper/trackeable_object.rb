class TrackeableObject

  def params
    'no params'
  end

  def a
    Ripley::Tracker.states_by_caller
  end

  def b
    variable1 = 'mm'
    Ripley::Tracker.states_by_caller
  end

  def c
    chain_method_1
  end

  def chain_method_1
    variable1 = 33
    Ripley::Tracker.states_by_caller
  end

  def d
    variable1 = 42
    chain_method_2
  end

  def chain_method_2
    variable1 = 'ww'
    Ripley::Tracker.states_by_caller
  end

end
