require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "scenarios/test_scenarios"

describe "Example with one scenario" do
  scenario :simple
  
  it "should have a scenario" do
    @zomg_all.should( be_true )
    @zomg_each.should( be_true )
    lol.should == "lol"
  end
end

describe "Example with multiple scenarios" do
  scenario :scenario_one
  scenario :scenario_two
  
  it "should have both scenarios" do
    one.should == "present"
    two.should == "also present"
    zero_cool?.should be_true
  end
end

describe "Nested Examples" do
  scenario :scenario_one
  
  it "has scenario methods, but not those of descendant examples" do
    one.should == "present"
    lambda { two }.should raise_error
    zero_cool?.should be_false
  end
  
  describe "(one deeper)" do
    scenario :scenario_two
    
    it "has scenario (local and parent example) methods" do
      one.should == "present"
      two.should == "also present"
      zero_cool?.should be_true
    end
  end
  
  describe "(one deeper, without extra scenario)" do
    it "has parent scenario methods" do
      one.should == "present"
      lambda { two }.should raise_error
      zero_cool?.should be_false
    end
  end
end

describe "Example with no scenario" do
  it "shouldn't have any scenario methods" do
    lambda { lol }.should raise_error
  end
end
