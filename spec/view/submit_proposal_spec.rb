require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))
require 'nokogiri'

describe SpeakingProposalView::New do

  before :each do
    class DummyController
      def name 
        "DummyController"
      end
      def flash
        {:errors => []}
      end
    end
    @page = Nokogiri::HTML(SpeakingProposalView::New.new(:controller => DummyController.new).to_s)
  end

  it "Should have a title text field" do
    @page.css('#title').should_not be_empty
  end

  it "should have a abstract text area" do
    @page.css('#abstract').should_not be_empty
  end

  it "should have a submit button" do
    @page.css("#submit").should_not be_empty
  end
end
