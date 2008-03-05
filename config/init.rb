# Make the app's "gems" directory a place where gems are loaded from
Gem.clear_paths
Gem.path.unshift(Merb.root / "gems")

# Make the app's "lib" directory a place where ruby files get "require"d from
$LOAD_PATH.unshift(Merb.root / "lib")


Merb::Config.use do |c|
  c[:session_secret_key]  = 'f6214d6a4702ff061096fe46736093d36e4e6acf'
  c[:session_store] = 'cookie'
  c[:use_mutex] = false
end  

### Merb doesn't come with database support by default.  You need
### an ORM plugin.  Install one, and uncomment one of the following lines,
### if you need a database.

### Uncomment for DataMapper ORM
use_orm :datamapper

### Uncomment for ActiveRecord ORM
# use_orm :activerecord

### Uncomment for Sequel ORM
# use_orm :sequel


### This defines which test framework the generators will use
### rspec is turned on by default
# use_test :test_unit
use_test :rspec

### Add your other dependencies here
dependency "haml"

dependency "merb_helpers"
dependency "merb_stories"

# These are some examples of how you might specify dependencies.
# 
# dependencies "RedCloth", "merb_helpers"
# OR
# dependency "RedCloth", "> 3.0"
# OR
# dependencies "RedCloth" => "> 3.0", "ruby-aes-cext" => "= 1.0"

Merb::BootLoader.after_app_loads do
  ### Add dependencies here that must load after the application loads:
  require 'merb-haml'
  # dependency "magic_admin" # this gem uses the app's model classes
end
