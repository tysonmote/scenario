module Scenario
  
  private
  
  class Scenarios
    
    # Add a new scenario.
    def self.register( name, modul )
      @@scenarios ||= {}
      @@scenarios[name.to_sym] = modul
    end
    
    # Get the scenario module for the given name.
    def self.for( name )
      @@scenarios[name.to_sym] || ( raise "No scenario named #{name.inspect}." )
    end
    
  end
  
end
