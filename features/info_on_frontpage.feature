Feature: Front Page
  In order to quickly see the most important information
  As a visitor
  I should see it on the front page

  Scenario Outline:
    Given I am a visitor
    When I surf to the front page
    Then I should see <text> in the text

  Scenarios:
    | text            |
    | 10-11 maj       |
    | Stockholm       |
    | Agila Sverige   |
    | blixttal        |
    | Open Space      |

  Scenario:
    Given I am a visitor
    When I surf to the front page
    Then I should see a submenu 

    
