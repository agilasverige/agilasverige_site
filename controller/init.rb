# Define a subclass of Ramaze::Controller holding your defaults for all
# controllers

class Controller < Ramaze::Controller
  layout '/page'
  helper :xhtml
  engine :Ezamar
end

# Here go your requires for subclasses of Controller:
require File.join(File.dirname(__FILE__),'main')
require File.join(File.dirname(__FILE__),'css')
require File.join(File.dirname(__FILE__),'as2008')
require File.join(File.dirname(__FILE__),'attendant')
