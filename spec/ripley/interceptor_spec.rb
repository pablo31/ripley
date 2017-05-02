require_relative '../spec_helper'

Ripley.ignore_file __FILE__

module Ripley
  describe Interceptor do

    let(:subject){ ProblematicObject.new }

    context "the 'states_by_caller' method" do

      it "should list nothing" do
        expect(Ripley.logger).to receive(:error).with('Generic error message [["ProblematicObject",{}]]')
        subject.a
      end

      it "should list one variable" do
        expect(Ripley.logger).to receive(:error).with('Generic error message [["ProblematicObject",{"variable1":"mm"}]]')
        subject.b
      end

      it "should list one variable in other method" do
        expect(Ripley.logger).to receive(:error).with('Generic error message [["ProblematicObject",{"variable1":"33"}],["ProblematicObject",{}]]')
        subject.c
      end

      it "should list one local variable and one variable in other method" do
        expect(Ripley.logger).to receive(:error).with('Generic error message [["ProblematicObject",{"variable1":"ww"}],["ProblematicObject",{"variable1":"42"}]]')
        subject.d
      end

    end

  end
end
