require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Scenario::Fixtures do
  it "provides text" do
    Scenario::Fixtures["basic.text"].should =~ /squeeze/
  end
end
