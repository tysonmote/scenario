Scenario
========

Scenarios is a super-simple way to move common setup and helper methods into cohesive "scenarios" that can be included easily in your specs. The advantage of a scenario over regular mixin modules is that you can use RSpec hooks (eg. `before :each {}`) to do the setup instead of having redundant, copy-pasted setup littering your specs.

Examples
--------

```ruby
# Describe your scenarios:

describe_scenario :user do
  before :all do
    @user = User.create( :name => "Bob", :password => "foo", :admin => false )
  end
  
  def login
    visit( url( :login ) )
    fill_in :name, :with => "Bob"
    fill_in :password, :with => "foo"
    click_button "Login"
    response
  end
end

describe_scenario :admin do
  before :all do
    @user = User.create( :name => "Sally", :password => "bar", :admin => true )
  end
  
  def login
    visit( url( :login ) )
    fill_in :name, :with => "Sally"
    fill_in :password, :with => "bar"
    click_button "Login"
    response
  end
end

# Write your specs:

describe "Logging in" do
  describe "as an user" do
    scenario :user
    
    it "should log them in" do
      login.should be_successful
    end
  end
  
  describe "as an admin" do
    scenario :admin
    
    it "should log them in" do
      login.should be_successful
    end
  end
end
```

Because scenarios are simply blocks that are run in the context where they are included, you can use as many as you want:

```ruby
describe "GET /message/new when database is down" do
  scenario :user
  scenario :database_down
  
  it "should show fail whale" do
    visit( "/message/new" )
    response.should contain( "fail whale" )
  end
end
```

And you can nest them:

```ruby
describe "GET /message/new" do
  scenario :user
  
  describe "when database is up" do
    it "should not show fail whale" do
      visit( "/message/new" )
      response.should_not contain( "fail whale" )
    end
  end
  
  describe "when database is down" do
    scenario :database_down
    
    it "should show fail whale" do
      visit( "/message/new" )
      response.should contain( "fail whale" )
    end
  end
end
```

Fixtures
--------

Basic fixture support is also included. (Please note that fixtures are currently 
hard-coded to `spec/scenarios/fixtures`. It will be configurable in a future
version. Feel free to open a pull request or just monkey patch the `root()`
method.

```ruby
Scenario::Fixtures['html/sample.html'] # Returns contents of the fixture as a string
```

`Scenario::Fixtures` caches the contents of the file so that the file only needs 
to be read once.

Version History
===============

* 0.3.0 - Remove support for module-based scenarios, allow calling RSpec hooks
  in scenarios.
* 0.2.0 - Add support for RSpec 1.3+
* 0.1.0 - Initial release with support for RSpec 2.x

Contributing to Scenario
========================
 
* Check out the latest master to make sure the feature hasn't been implemented
  or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it 
  and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a 
  future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to 
  have your own version, or is otherwise necessary, that is fine, but please 
  isolate to its own commit so I can cherry-pick around it.

Copyright
=========

Copyright (c) 2011 Tyson Tate. See LICENSE.txt for further details.
