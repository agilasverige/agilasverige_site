Feature: Signup
  
  In order to register for the conference
  As a visitor
  I can sign up on the web

  Scenario:
    Given I have previously not signed up
    When I register for the conference with correct data
    Then my personal information is stored
    And I see a confirmation page
    And I get a confirmation email
