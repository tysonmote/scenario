$LOAD_PATH.unshift( File.join( File.dirname( __FILE__ ), '..', 'lib' ) )

begin
  # 2.x
  require 'rspec'
  $rspec1 = false
  $rspec2 = true
rescue LoadError
  # 1.x
  require 'spec'
  $rspec1 = true
  $rspec2 = false
end
require 'scenario'
