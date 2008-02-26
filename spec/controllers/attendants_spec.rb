require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Attendants, "index action" do
  before(:each) do
    @controller = Attendants.build(fake_request)
    @controller.dispatch('index')
  end
end