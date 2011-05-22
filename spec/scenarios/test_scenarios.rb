describe_scenario :simple do
  before :all do
    @scenario_all = true
  end
  
  before :each do
    @scenario_each = true
  end
  
  let :let_block do
    @let_block ||= 0
    @let_block += 1
  end
  
  def scenario_method
    "present"
  end
end

describe_scenario :scenario_one do
  before :each do
    @scenario_one_present = true
  end
  
  def one
    "present"
  end
  
  def scenario_method?
    false
  end
end

describe_scenario :scenario_two do
  before :each do
    @scenario_two_present = true
  end
  
  def two
    "also present"
  end
  
  def scenario_method?
    true
  end
end

describe_scenario :setup_scenario do
  def setup_thing1
    @thing1 = "set up"
  end
  
  def setup_thing2( *params )
    @thing2 = params
  end
  
  def thing1
    @thing1
  end
  
  def thing2
    @thing2
  end
end