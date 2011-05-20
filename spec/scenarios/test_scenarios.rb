describe_scenario :block_defined do
  define :lol do
    "lol"
  end
  
  define :zomg do
    @zomg = true
  end
  
  define :rad_params do |how_rad|
    "This is #{how_rad} rad!"
  end
end

module ModuleDefined
  def lol
    "for reals"
  end
end

describe_scenario :module_defined, ModuleDefined

describe_scenario :mixed_defined, ModuleDefined do
  def lol
    "overridden"
  end
  
  def omg
    "added"
  end
end

describe_scenario :scenario_one do
  define :one do
    "present"
  end
  
  define "zero_cool?" do
    false
  end
end

describe_scenario :scenario_two do
  define :two do
    "also present"
  end
  
  define "zero_cool?" do
    true
  end
end
