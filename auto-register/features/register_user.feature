Feature: Register user

  Scenario: Attempt to register a fake user
    Given I am on SiteMaker homepage
    Then I will invoke registration form
    Then I should see registration form
    Then I will fill fake credentials
    Then I will click the sign up button
    Then I will log out
    Then I will save user credentials to a file
