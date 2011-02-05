require 'spec_helper'

describe '/home/show' do

  before :each do
    render
  end

  it 'does not show an edit link' do
    assert_select('a', false)
  end

  describe 'when admin is logged in' do
    
    before :each do
      admin = User.make!(:role => 'admin')
      admin.confirm!
      assigns[:user] = admin
      sign_in admin
      render
    end

    it 'shows an edit link' do
      assert_select('a', 'Editera')
    end
  end
end
