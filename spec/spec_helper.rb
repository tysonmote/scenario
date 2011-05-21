$LOAD_PATH.unshift( File.join( File.dirname( __FILE__ ), '..', 'lib' ) )

begin
  # 2.x
  require 'rspec'
rescue LoadError
  # 1.x
  require 'spec'
end
require 'scenario'
