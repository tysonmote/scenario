Scenario
========

Scenario brings basic "scenarios" to RSpec. You can define scenarios with a
block or by passing in a Module (or even both).

Block:

```ruby
describe_scenario :admin do
  define :setup_user do |name|
    User.create( :name => name, :admin => true )
  end
end

describe "Admin pages" do
  scenario :admin
  
  ...
end
```

Module:

```ruby
module AdminMethods
  def setup_user( name )
    User.create( :name => name, :admin => true )
  end
end

describe_scenario :admin, AdminMethods

describe "Admin pages" do
  scenario :admin
  
  ...
end
```

Both:

```ruby
module AdminMethods
  def setup_user( name )
    User.create( :name => name, :admin => true )
  end
end

describe_scenario :admin, AdminMethods do
  define :admin?( user )
    user.admin == true
  end
end

describe "Admin pages" do
  scenario :admin
  
  ...
end
```

Because scenarios are just Modules, you can use as many as you want:

```ruby
describe "Admin pages" do
  scenario :users
  scenario :admin
  
  ...
end
```

And you can nest them:

```ruby
describe "Login" do
  scenario :login
  
  describe "as an admin" do
    scenario :admin
    
    ...
  end
  
  describe "as a regular user" do
    scenario :user
    
    ...
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
