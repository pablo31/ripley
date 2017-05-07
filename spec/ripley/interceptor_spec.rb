require_relative '../spec_helper'

Ripley.ignore_file __FILE__

module Ripley
  describe Interceptor do

    let(:subject){ ProblematicObject.new }

    context "the 'states_by_caller' method" do

      it "should list nothing" do
        expect(Ripley.logger).to receive(:error).with('Generic error message [["problematic_object",{}]]')
        expect{ subject.a }.to raise_error RuntimeError
      end

      it "should list one variable" do
        expect(Ripley.logger).to receive(:error).with('Generic error message [["problematic_object",{"variable1":"mm"}]]')
        expect{ subject.b }.to raise_error RuntimeError
      end

      it "should list one variable in other method" do
        expect(Ripley.logger).to receive(:error).with('Generic error message [["problematic_object",{"variable1":"33"}],["problematic_object",{}]]')
        expect{ subject.c }.to raise_error RuntimeError
      end

      it "should list one local variable and one variable in other method" do
        expect(Ripley.logger).to receive(:error).with('Generic error message [["problematic_object",{"variable1":"ww"}],["problematic_object",{"variable1":"42"}]]')
        expect{ subject.d }.to raise_error RuntimeError
      end

    end

  end
end
