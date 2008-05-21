require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Program, "index action" do
  before(:each) do
    dispatch_to(Program, :index)
  end
end