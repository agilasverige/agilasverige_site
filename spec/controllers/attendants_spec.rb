require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Attendants, "create a new user" do
  before(:each) do
    dispatch_to(Attendants, :create, {:attendant => {:first_name => "first"}})
  end
  
  
end