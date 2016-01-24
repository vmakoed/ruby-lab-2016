Feature: Register multiple users

  Scenario: Attempt to register multiple fake users
    Given I am on GOG homepage
    Then I will register "10" fake users
