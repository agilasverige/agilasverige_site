$TESTING=true
require 'rubygems'
require 'merb-core'
require "merb-core/test/helpers"
require "merb-core/test/request_helper"

# TODO: Boot Merb, via the Test Rack adapter
Merb.start :environment => (ENV['MERB_ENV'] || 'test'),
           :adapter     => 'runner',
           :merb_root  => File.join(File.dirname(__FILE__), ".." )


Spec::Runner.configure do |config|
  config.include(Merb::Test::Helpers)
  config.include(Merb::Test::RequestHelper)
  config.include(Merb::RenderMixin)
end
