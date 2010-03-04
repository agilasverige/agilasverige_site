@http://www.pivotaltracker.com/story/show/2533927
Feature: Signup
  In order to register for the conference
  As someone unregistered
  I want to signup on the webpage

  Scenario:
    Given I am a previously unregistered visitor
    When I register as an attendant
    Then my information is saved
    And a uid is generated
    And I see a confirmation page
    And I receive an email with an unique link
