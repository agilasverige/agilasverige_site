require File.join(File.dirname(__FILE__),'..','spec_helper')
require 'nokogiri'

describe PreviousConferences::ZeroEight do

  before :each do

    class DummyController
      def name 
        "DummyController"
      end
    end
    presentation1 = Presentation.new
    presentation1.author = 'author'
    presentation1.title = 'title'
    presentation1.files.push 'file1.ppt'
    presentation1.files.push 'file2.pdf'
    presentation1.files.push 'file3.zip'
    view = PreviousConferences::ZeroEight.new(:controller => DummyController.new, :presentations => [presentation1])

    @doc = Nokogiri::HTML(view.to_s)
  end

  it 'should show author' do
    @doc.css('#presentations').text.should =~ /author/ 
  end

  it 'should show title' do
    @doc.css('#presentations').text.should =~ /title/ 
  end

  it 'should have link to file1.ppt' do
    @doc.css('a#file1_ppt').inner_html.should =~ /ppticon.gif/ 
  end

  it 'should have link to file1.pdf' do
    @doc.css('a#file2_pdf').inner_html.should =~ /pdficon.gif/ 
  end

  it 'should have link to file1.zip' do
    @doc.css('a#file3_zip').inner_html.should =~ /zipicon.gif/ 
  end
end

describe PreviousConferences::ZeroNine do

  before :each do
    class DummyController
      def name 
        "DummyController"
      end
    end
    @view = Nokogiri.HTML(PreviousConferences::ZeroNine.new(:controller => DummyController.new).to_s)
  end

  it 'should have a link to vimeo archive' do
    @view.inner_html.should =~ /http:\/\/www.vimeo.com\/user2794604/
  end

  it 'should have a link to slideshare' do
    @view.inner_html.should =~ /http:\/\/www.slideshare.net\/event\/agila-sverige-2009\/slideshows/
  end

end

describe PreviousConferences::OneZero do

  before :each do
    class DummyController
      def name 
        "DummyController"
      end
    end
    @view = Nokogiri.HTML(PreviousConferences::OneZero.new(:controller => DummyController.new).to_s)
  end

  it 'should have a link to slideshare' do
    @view.inner_html.should =~ /http:\/\/www.slideshare.net\/event\/agila-sverige-2010\/slideshows/
  end

end
