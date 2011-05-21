module Scenario
  
  private
  
  class Scenarios
    
    @@scenarios = {}
    
    # Add a new scenario.
    def self.add( name, block )
      @@scenarios[name.to_sym] = block
    end
    
    # Get the scenario block for the given name.
    def self.for( name )
      name = name.to_sym
      @@scenarios[name]
    end
    
  end
  
end
