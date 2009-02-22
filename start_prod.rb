require 'rubygems'
require 'ramaze'

# require all controllers and models
acquire __DIR__/:controller/'*'
acquire __DIR__/:lib/'*'
acquire __DIR__/:view/'*.rb'
# acquire __DIR__/:model/'*'

# Ramaze::Route[/(\/2008)\/(.*)/] = "Vjjjjjjj1

  
# r.match("/2008") do |year| 
#   year.match('').to(:controller => 'articles', :action => 'index').name(:home)
#   year.match('/tack').to(:controller => 'articles', :action => 'thanks').name(:thanks_for_signing_up)
#   year.match('/program').to(:controller => 'program', :action => 'index').name(:program)
#   year.match('/all_emails').to(:controller => 'attendants', :action => 'all_emails').name(:all_emails)
#   year.match('/speaker_emails').to(:controller => 'attendants', :action => 'speaker_emails').name(:speaker_emails)
# 
#   year.resources :attendants do |a|
#     a.resources :speaking_proposals
#   end
#
#   year.resources :speaking_proposals
# end
# 
# r.match("/").to(:controller => 'articles', :action => 'index')
 
  
#Ramaze.start :adapter => :mongrel, :port => 7000
