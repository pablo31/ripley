require_relative 'spec_helper'

Ripley.ignore_file __FILE__

describe Ripley do

  let(:subject){ RipleyableObject.new }

  context "the 'states_by_caller' method" do

    it "should list nothing" do
      expect(Ripley.logger).to receive(:error).with('some message [["RipleyableObject",{}]]')
      subject.a
    end

    it "should list one variable" do
      expect(Ripley.logger).to receive(:error).with('some message [["RipleyableObject",{"variable1":"mm"}]]')
      subject.b
    end

    it "should list one variable in other method" do
      expect(Ripley.logger).to receive(:error).with('some message [["RipleyableObject",{"variable1":"33"}],["RipleyableObject",{}]]')
      subject.c
    end

    it "should list one local variable and one variable in other method" do
      expect(Ripley.logger).to receive(:error).with('some message [["RipleyableObject",{"variable1":"ww"}],["RipleyableObject",{"variable1":"42"}]]')
      subject.d
    end

  end

end
