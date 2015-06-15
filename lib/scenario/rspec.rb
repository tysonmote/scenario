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
      def scenario( name, opts={}, &block )
        @_scenario_context = name.to_sym
        scenario = Scenario::Scenarios.for( name )
        
        # Load scenario
        self.module_eval( &scenario )
        
        # Set up
        Array( opts[:setup] ).each do |subject|
          before do
            self.__send__ "setup_#{subject}"
          end
        end
        before(&block) if block_given?
      end
      
      def setup_for( name, &block )
        self.send( :define_method, "setup_#{name}", block )
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
