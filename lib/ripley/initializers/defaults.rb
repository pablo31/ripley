module Ripley
  self.logger = Loggers::Default.new
  self.logger_formatter = Formatters::Logger::Default.new
  self.object_formatter = Formatters::Object::FileAndLine.new
  self.state_entry_builder = StateEntryBuilders::LocalVariables.new
end
