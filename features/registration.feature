Feature: Attendant Signup
  
  In order to register for the conference
  As a visitor
  I can sign up on the web

  Scenario:
     Given I have previously not signed up
     When I register as an attendant with correct data
     Then my attendant information is stored
     And a unique identifier is created
     And I see a confirmation page
     And I get a confirmation email with a url to my page


  # Scenario:
  #   Given I have previously not signed up
  #   When I register as a speaker with correct data
  #   Then my speaker information is stored
  #   And I see a confirmation page
  #   And I get a confirmation email


