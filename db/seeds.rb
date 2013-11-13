require File.join(File.dirname(__FILE__),'..','spec','support','blueprints')

begin
u = User.make(:email => 'admin@example.org', :password => '121212', :password_confirmation => '121212', :role => 'admin')
u.confirm!

rescue  
  puts $! 
end

40.times do 
  u = User.make(:confirmed_at => Date.today) 
  s = SpeakingProposal.make
  u.speaking_proposals << s
  u.save!
end

AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
