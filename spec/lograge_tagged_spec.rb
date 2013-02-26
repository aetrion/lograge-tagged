require 'spec_helper'
require 'lograge_tagged'

describe LogrageTagged::LogSubscriber do

  subject { LogrageLogSubscriber.new }
  
  LogrageLogSubscriber = Class.new do
    include LogrageTagged::LogSubscriber
    def process_action_lograge(payload)
      payload.map { |k,v| string << "#{k}=#{v}" }.join(" ")
    end
  end

  describe "#process_action_tagged" do
    it "prepends the tag to the processed payload" do
      line = subject.process_action_tagged(foo: "1", bar: "2")
      line.should eq("")
    end
  end

end
