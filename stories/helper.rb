require 'rubygems'
require 'spec/rake/spectask'
require File.join(File.dirname(__FILE__), "..", "spec", "spec_helper")
require 'spec/mocks'
require 'spec/story'

require 'merb_stories'

class MerbStory
  # Include your custom helpers here
  include Merb::Test::RequestHelper
  include Merb::Test::Rspec::ViewMatchers
end

Dir['stories/steps/**/*.rb'].each do |steps_file|
  require steps_file
end
