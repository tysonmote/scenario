require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "scenarios/test_scenarios"

# =========
# = Basic =
# =========

describe "describe with one scenario" do
  scenario :simple
  
  it "should have a scenario" do
    @scenario_all.should( be_true )
    @scenario_each.should( be_true )
    let_block.should == 1
    scenario_method.should == "present"
  end
end

describe "describe with multiple scenarios" do
  scenario :scenario_one
  scenario :scenario_two
  
  it "should have both scenarios" do
    one.should == "present"
    two.should == "also present"
    scenario_method?.should be_true
  end
end

describe "describe without a scenario" do
  it "shouldn't have a scenario" do
    @scenario_all.should be_nil
    @scenario_each.should be_nil
    lambda { lol }.should raise_error
  end
end

# ===========
# = Nesting =
# ===========

describe "Nested describes" do
  scenario :scenario_one
  
  it "don't leak nested scenarios to the parent describe" do
    one.should == "present"
    lambda { two }.should raise_error
    scenario_method?.should be_false
    @scenario_one_present.should be_true
    @scenario_two_present.should be_nil
  end
  
  describe "in nested describe with an added scenario" do
    scenario :scenario_two
    
    it "has all scenarios" do
      one.should == "present"
      two.should == "also present"
      scenario_method?.should be_true
      @scenario_one_present.should be_true
      @scenario_two_present.should be_true
    end
  end
  
  context "in nested context with an added scenario" do
    scenario :scenario_two
    
    it "has all scenarios" do
      one.should == "present"
      two.should == "also present"
      scenario_method?.should be_true
      @scenario_one_present.should be_true
      @scenario_two_present.should be_true
    end
  end
  
  describe "in nested example without an additional scenario" do
    it "has parent scenario" do
      one.should == "present"
      lambda { two }.should raise_error
      scenario_method?.should be_false
      @scenario_one_present.should be_true
      @scenario_two_present.should be_nil
    end
  end
end

# ==========
# = Shared =
# ==========

shared_examples_for "without scenario in the shared group" do
  it "should inherit scenario" do
    @scenario_all.should( be_true )
    @scenario_each.should( be_true )
    let_block.should == 1
    scenario_method.should == "present"
  end
end

shared_examples_for "with scenario in the shared group" do
  scenario :simple
  
  it "should have a scenario" do
    @scenario_all.should( be_true )
    @scenario_each.should( be_true )
    let_block.should == 1
    scenario_method.should == "present"
  end
end

describe "Shared example groups" do
  context "without scenario in shared group" do
    scenario :simple
    it_should_behave_like "without scenario in the shared group"
  end
  
  if $rspec2
    context "with scenario in shared group" do
      it_should_behave_like "with scenario in the shared group"
      
      it "shouldn't leak" do
        @scenario_all.should be_nil
        @scenario_each.should be_nil
        lambda { scenario_method }.should raise_error
      end
    end
  end
end

# ==================
# = Scenario setup =
# ==================

describe "scenario with setup methods" do
  describe "without calling setup" do
    scenario :setup_scenario
    
    it "shouldn't do any setup" do
      thing1.should be_nil
    end
  end
  
  describe "calling setup via opts hash" do
    scenario :setup_scenario, :setup => :thing1
    
    it "sets up" do
      thing1.should == "set up"
    end
  end
  
  describe "calling setup via block" do
    scenario :setup_scenario do
      setup_thing2( "a", "b" )
    end
    
    it "sets up" do
      thing2.should == ["a", "b"]
    end
  end
  
  describe "calling setup via opts hash and block" do
    scenario :setup_scenario, :setup => [:thing1] do
      setup_thing2( "a", "b" )
    end
    
    it "works" do
      thing1.should == "set up"
      thing2.should == ["a", "b"]
    end
  end
end
