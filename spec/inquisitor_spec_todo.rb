# require_relative 'spec_helper'

# module Ripley
#   describe Inquisitor do

#     # context "on a blank class" do

#     #   class MyClass; end

#     #   context "on an instance" do

#     #     let(:object){ MyClass.new }

#     #     it "should return the associated inquisitor" do
#     #       inquisitor = object.__ripley_inquisitor
#     #       expect(inquisitor).to be_instance_of Inquisitor
#     #     end

#     #     it "should return an empty watched methods collection" do
#     #       methods = object.__ripley_inquisitor.watched_methods
#     #       expect(methods).to be_empty
#     #     end

#     #   end

#     #   context "on a class" do

#     #     let(:klass){ MyClass }

#     #     it "should return the associated inquisitor" do
#     #       inquisitor = klass.__ripley_inquisitor
#     #       expect(inquisitor).to be_instance_of Inquisitor
#     #     end

#     #     it "should return an empty watched methods collection" do
#     #       methods = klass.__ripley_inquisitor.watched_methods
#     #       expect(methods).to be_empty
#     #     end

#     #   end

#     # end

#     context "on a defined class" do

#       class MyDefinedClass1
#         Ripley::Inquisitor.for(self).watch(:method1).watch(:method2).watch(:method3).watch(:method4)
#         def self.method1; 'value1'; end
#         def self.method2; 'value2'; end
#         def method3; 'value3'; end
#       end

#       let(:klass){ MyDefinedClass1 }

#       it "should return the associated inquisitor" do
#         inquisitor = klass.__ripley_inquisitor
#         expect(inquisitor).to be_instance_of Inquisitor
#       end

#       it "should return the empty watched methods collection" do
#         methods = klass.__ripley_inquisitor.watched_methods
#         expect(methods).to contain_exactly :method1, :method2, :method3, :method4
#       end

#       it "should return the method values" do
#         result = klass.__ripley_inquisitor.judge(klass)
#         expect(result).to eq method1: 'value1', method2: 'value2'
#       end

#     end

#     context "on a defined class instance" do

#       class MyDefinedClass2
#         Ripley::Inquisitor.for_instances_of(self).watch(:method1).watch(:method2).watch(:method3).watch(:method4)
#         def method1; 'value1'; end
#         def method2; 'value2'; end
#         def self.method3; 'value3'; end
#       end

#       let(:object){ MyDefinedClass2.new }

#       it "should return the associated inquisitor" do
#         inquisitor = object.__ripley_inquisitor
#         expect(inquisitor).to be_instance_of Inquisitor
#       end

#       it "should return the watched methods collection" do
#         result = object.__ripley_inquisitor.judge(object)
#         expect(result).to eq method1: 'value1', method2: 'value2'
#       end

#     end

#   end
# end
