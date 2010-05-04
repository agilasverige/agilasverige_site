require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))

describe BaseView do

  before :each do
    class DummyController
      def name 
        "DummyController"
      end
    end
    @page = BaseView.new(:controller => DummyController.new).to_s
  end

  it 'should have xmlns tag' do
    @page.should match(/lang=\"sv\" xml:lang="sv" xmlns="http:\/\/www.w3.org\/1999\/xhtml"/)
  end
end
