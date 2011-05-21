require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

# ===========
# = Jeweler =
# ===========

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "scenario"
  gem.homepage = "http://github.com/tysontate/scenario"
  gem.license = "MIT"
  gem.summary = %Q{Basic spec scenarios for RSpec.}
  gem.description = %Q{Basic spec scenarios for RSpec. Also includes basic fixtures support.}
  gem.email = "tyson@tysontate.com"
  gem.authors = ["Tyson Tate"]
  gem.add_dependency "rspec", ">= 1.3"
end
Jeweler::RubygemsDotOrgTasks.new

# =========
# = Specs =
# =========

spec_files = FileList['spec/**/*_spec.rb']
begin
  # 2.x
  require 'rspec/core'
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = spec_files
    spec.rspec_opts = ["--format", "documentation"]
  end
rescue LoadError
  # 1.x
  require 'spec'
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new(:spec) do |spec|
    spec.pattern = spec_files
    spec.spec_opts = ["--format", "specdoc"]
  end
end

task :default => :spec

# ========
# = Docs =
# ========

require 'yard'
YARD::Rake::YardocTask.new
