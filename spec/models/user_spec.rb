require 'spec_helper'

describe User do

  it { should have_many :speaking_proposals }

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

  end

      
end
