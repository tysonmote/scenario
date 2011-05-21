# ===================
# = RSpec additions =
# ===================

module Scenario
  
  private
  
  begin
    # 2.x
    ExampleGroup = RSpec::Core::ExampleGroup
  rescue NameError
    # 1.x
    ExampleGroup = Spec::Example::ExampleGroup
  end
  
  module RSpecExtensions
    
    # ExampleGroup methods
    module ExampleGroupExtensions
      
      # Load a given scenario
      def scenario( name, &block )
        @_scenario_context = name.to_sym
        scenario = Scenario::Scenarios.for( name )
        self.module_eval( &scenario )
      end
      
    end
    ExampleGroup.send :extend, ExampleGroupExtensions
    
    # Global methods.
    module ObjectExtensions
      
      def describe_scenario( name, &block )
        raise "Scenario #{name} has already been defined." if Scenario::Scenarios.for( name )
        Scenario::Scenarios.add( name, block )
      end
      
    end
    Object.send :include, ObjectExtensions
    
  end
  
end
