require File.join(File.dirname(__FILE__),'..','..','view','init')
require 'nokogiri'
require 'spec'

describe 'AS2008' do

  before :each do

    @doc = Nokogiri::HTML(AS2008.new.to_s)
  end

  it 'should have a list' do
    

  end
end
