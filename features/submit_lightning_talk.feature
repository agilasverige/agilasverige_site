#coding: utf-8
Feature: Submit Lightning Talk
  In order to express my wish to speak at the conference
  As a registered attendant
  I can submit a lightning talk

  Scenario:
    Given I am a registered attendant with:
      | email    | test@test.test |
      | password | password       |
    And I am logged in with "test@test.test":"password"
    And I am on the start page
    And I follow "Anmäl blixttal"
    And I fill in "Spångar eller spänger" for "Titel"
    And I fill in "En faschinerande tur genom småbrosvenskan" for "Beskrivning"
    Then show me the page
    And I press "Skicka in"
    Then I should see "Tack för din blixttalsanmälan"
    And "test@test.test" should have received an email
