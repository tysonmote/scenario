require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "scenarios/test_scenarios"

describe "Example with no scenario" do
  it "shouldn't have any scenario methods" do
    lambda { lol }.should raise_error
    lambda { zomg }.should raise_error
    lambda { rad_params }.should raise_error
  end
end

describe "Example with block-defined scenario" do
  scenario :block_defined
  
  it "should have scenario methods" do
    lol.should == "lol"
    zomg && @zomg.should( be_true )
    rad_params( "super" ).should == "This is super rad!"
  end
end

describe "Example with block-defined scenario in before hook" do
  scenario :block_defined
  
  before :each do
    lol.should == "lol"
    zomg && @zomg.should( be_true )
    rad_params( "super" ).should == "This is super rad!"
  end
  
  it "should have scenario methods" do
    @zomg.should be_true
  end
end

describe "Example with module-defined scenario" do
  scenario :module_defined
  
  it "should have scenario methods" do
    lol.should == "for reals"
  end
end

describe "Example with mixed-defined scenario" do
  scenario :mixed_defined
  
  it "should have scenario methods" do
    lol.should == "overridden"
    omg.should == "added"
  end
end

describe "Example with multiple scenarios" do
  scenario :scenario_one
  scenario :scenario_two
  
  it "should have scenario methods" do
    one.should == "present"
    two.should == "also present"
    zero_cool?.should be_true
  end
end
