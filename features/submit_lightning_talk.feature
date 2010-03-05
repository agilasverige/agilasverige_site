Feature: Submit Lightning Talk
  In order to express my wish to speak at the conference
  As a registered attendant
  I can submit a lightning talk

  Scenario:
    Given I am a registered attendant
    When I submit a lightning talk
    Then my lightning is stored
    And I get a confirmation email
    And it is shown on my page

    
