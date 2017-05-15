register = Ripley::Register.instance

register.ignore do |binding|
  !!register.ignored?(binding.file)
end

register.ignore do |binding|
  next true if binding.file.include?('/ripley/') && !binding.file.include?('/spec/')
  next true if binding.file.include?('rspec')
  next true if binding.file.include?('ruby_executable_hooks')
  false
end
