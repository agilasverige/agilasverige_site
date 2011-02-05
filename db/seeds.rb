require File.join(File.dirname(__FILE__),'..','spec','support','blueprints')

u = User.make!(:email => 'admin@example.org', :password => '121212', :password_confirmation => '121212', :role => 'admin')
u.confirm!
