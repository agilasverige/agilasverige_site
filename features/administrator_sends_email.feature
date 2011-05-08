Feature: Administrator Sends Email

  In order to deliver information to attendants
  An administrator can send email to them

  Scenario: Send to everyone

    Given the following attendants exist:
      | email                 | speaker | dinner |
      | attendant@example.org | false   | false  |
      | speaker@example.org   | true    | false  |
      | dinner@example.org    | false   | true   |
      | both@example.org      | true    | true   |
    When an admin sends an email to everyone
    Then "attendant@example.org" should receive an email
    And "speaker@example.org" should receive an email
    And "dinner@example.org" should receive an email
    And "both@example.org" should receive an email
