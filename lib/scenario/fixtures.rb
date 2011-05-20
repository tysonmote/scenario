module Scenario
  
  # Easy access to fixture files (HTML, CSS, JSON, etc.)
  class Fixtures
    
    def self.[]( rel_path )
      @content_cache ||= {}
      
      unless @content_cache.key?( rel_path )
        path = "#{self.root}/#{rel_path}"
        raise "#{path} doesn't exist or is not a file." unless File.file?( path )
        @content_cache[rel_path] = File.open( path, 'r' ).read
      end
      
      @content_cache[rel_path]
    end
    
    protected
    
    def self.root
      # TODO: Use spec root (?)
      "#{Dir.pwd}/spec/scenarios/fixtures"
    end
    
  end
  
end
