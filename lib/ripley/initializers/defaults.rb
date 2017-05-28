module Ripley
  self.logger = Loggers::Default.new
  self.logger_formatter = Formatters::Logger::Default.new
  self.object_formatter = Formatters::Object::FileAndLine.new
  self.variable_formatter = Formatters::Variable::Name.new
  self.value_formatter = Formatters::Value::AsString.new
end
