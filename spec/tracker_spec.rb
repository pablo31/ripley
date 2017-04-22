require_relative 'spec_helper'

class TrackeableObject

  def params
    'no params'
  end

  def a
    Ripley::Tracker.generate_states_by_caller
  end

  def b
    variable1 = 'mm'
    Ripley::Tracker.generate_states_by_caller
  end

  def c
    chain_method_1
  end

  def chain_method_1
    variable1 = 33
    Ripley::Tracker.generate_states_by_caller
  end

  def d
    variable1 = 42
    chain_method_2
  end

  def chain_method_2
    variable1 = 'ww'
    Ripley::Tracker.generate_states_by_caller
  end

end

module Ripley
  describe Tracker do

    let(:subject){ TrackeableObject.new }

    def match_state(arg, expected_partial_object_name, expected_variables)
      object_name, variables = arg
      expect(object_name.include?(expected_partial_object_name)).to be true
      expect(variables).to eq expected_variables
    end

    context "the 'generate_states_by_caller' method" do

      it "should list nothing" do
        result = subject.a
        expect(result.count).to eq 1
        match_state(result[0], 'TrackeableObject', {})
      end

      it "should list one variable" do
        result = subject.b
        expect(result.count).to eq 1
        match_state(result[0], 'TrackeableObject', { variable1: 'mm' })
      end

      it "should list one variable in other method" do
        result = subject.c
        expect(result.count).to eq 2
        match_state(result[0], 'TrackeableObject', { variable1: '33' })
        match_state(result[1], 'TrackeableObject', {})
      end

      it "should list one local variable and one variable in other method" do
        result = subject.d
        expect(result.count).to eq 2
        match_state(result[0], 'TrackeableObject', { variable1: 'ww' })
        match_state(result[1], 'TrackeableObject', { variable1: '42' })
      end

    end

  end
end
