register = Ripley::Register.instance

register.ignore do |binding|
  !!register.ignored?(binding.file)
end

register.ignore do |binding|
  # next false if binding.object.respond_to?(:ripleyable?) && binding.object.ripleyable?
  next true if binding.short_file.start_with?('/gems/ripley')
  # next true if binding.file.include?('/ripley/')
  next true if binding.file.include?('rspec')
  next true if binding.file.include?('ruby_executable_hooks')
  false
end
