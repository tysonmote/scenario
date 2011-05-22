require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Scenario::Fixtures do
  it "provides text" do
    Scenario::Fixtures["basic.text"].should =~ /squeeze/
  end
  
  it "bombs out on non-existant files" do
    lambda { Scenario::Fixtures["lol.text"] }.should raise_error( RuntimeError )
  end
end
