$: << File.expand_path( File.dirname( __FILE__ ) )

begin
  require "rspec"
rescue LoadError
  require "spec"
end

require 'scenario/fixtures'
require 'scenario/scenario'
require 'scenario/rspec'
