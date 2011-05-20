# ===================
# = RSpec additions =
# ===================

module Scenario
  
  private
  
  # ExampleGroup methods
  module ExampleGroupExtensions
    
    # Tell Scenario which scenario you want to use
    def scenario( name, &block )
      modul = Scenario::Scenarios.for( name )
      modul.module_exec( &block ) if block_given?
      self.send( :include, modul )
    end
    
  end
  RSpec::Core::ExampleGroup.send :extend, Scenario::ExampleGroupExtensions
  
  # Global methods.
  module ObjectExtensions
    
    # Set up a new scenario and add to the collection of scenarios.
    def describe_scenario( name, base=nil, &block )
      modul = base ? base.dup : Module.new
      modul.module_exec( &block ) if block_given?
      Scenario::Scenarios.register( name, modul )
    end
    
    # Syntax sugar for defining a scenario method inside a `describe_scenario`
    # block.
    def define( method_name, &block )
      self.send( :define_method, method_name, &block )
    end
    
  end
  Object.send :include, Scenario::ObjectExtensions
  
end
