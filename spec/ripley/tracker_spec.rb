require_relative '../spec_helper'

Ripley.ignore_file __FILE__

module Ripley
  describe Tracker do

    let(:subject){ TrackeableObject.new }

    def match_state(arg, expected_partial_object_name, expected_variables)
      object_name, variables = arg
      expect(object_name.include?(expected_partial_object_name)).to be true
      expect(variables).to eq expected_variables
    end

    context "the 'states_by_caller' method" do

      it "should list nothing" do
        result = subject.a
        expect(result.count).to eq 1
        match_state(result[0], 'trackeable_object', {})
      end

      it "should list one variable" do
        result = subject.b
        expect(result.count).to eq 1
        match_state(result[0], 'trackeable_object', { variable1: 'mm' })
      end

      it "should list one variable in other method" do
        result = subject.c
        expect(result.count).to eq 2
        match_state(result[0], 'trackeable_object', { variable1: '33' })
        match_state(result[1], 'trackeable_object', {})
      end

      it "should list one local variable and one variable in other method" do
        result = subject.d
        expect(result.count).to eq 2
        match_state(result[0], 'trackeable_object', { variable1: 'ww' })
        match_state(result[1], 'trackeable_object', { variable1: '42' })
      end

    end

  end
end
