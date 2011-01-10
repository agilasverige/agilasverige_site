require 'spec_helper'

describe User do

  describe 'Without mandatory arguments' do
    before(:each) do
      @user = User.new
    end

    it 'should not be saveable' do
      @user.valid?.should be_false
    end
  end

  describe 'Created with all mandatory argument' do

    before(:each) do
      @user = User.make!
    end

    it 'should be valid' do
      @user.should be_valid
    end

    it 'should have a uid' do
      @user.uid.should_not be_nil
    end

    it 'should have a unique url' do
      @user.unique_url.should == "http://www.agilasverige.se/users/#{@user.uid}"
    end

  end

      
end
