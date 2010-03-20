Feature: Send email to attendants
  In order to communicate with attendants
  As a conference admin
  I want to send email from the web interface

  Scenario:
    Given I am a logged in administrator
    When I select to send an email
    And I select all attendants as recipients
    And I enter a text body
    And I click send button
    Then an email is sent to all attendants
    And a copy is sent to as-xx list
