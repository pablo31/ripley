class CustomStateEntryBuilder < Ripley::StateEntryBuilders::LocalVariables

  # override
  def object_name_for(caller_binding, caller_index)
    object = caller_binding.receiver
    if object.is_a?(Module) || object.is_a?(Class)
      "#{object.name}"
    else
      return 'main' if object.to_s == 'main'
      "#{object.class.name}"
    end
  end

  # override
  def ignore?(object_name)
    return true if object_name == 'Ripley'
    super
  end

end
