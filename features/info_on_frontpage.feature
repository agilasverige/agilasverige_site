Feature: Front Page
  In order to quickly see the most important information
  As a visitor
  I should see it on the front page

  Scenario Outline:
    Given I am a visitor
    When I surf to the front page
    Then I should see <text>

  Scenarios:
    | text            |
    | 10-11 maj       |
    | Ingenjörshuset  |
    | Stockholm       |
    | Agila Sverige   |
    | Blixttal        |
    | Open Space      |
    
