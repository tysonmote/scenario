describe_scenario :simple do
  before :each do
    @zomg_each = true
  end
  
  before :all do
    @zomg_all = true
  end
  
  def lol
    "lol"
  end
end

describe_scenario :scenario_one do
  def one
    "present"
  end
  
  def zero_cool?
    false
  end
end

describe_scenario :scenario_two do
  def two
    "also present"
  end
  
  def zero_cool?
    true
  end
end
