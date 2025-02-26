Feature: Login Page
  As a user
  I want to be able to log in to the system
  So that I can access my account

  Background:
    Given I open the site "/login"

  Scenario: User can see the login page
    Then the element "data-test='input-email'" is displayed
    Then the element "data-test='input-password'" is displayed
    Then the element "data-test='btn-login'" is displayed
    Then the element "data-test='link-forgot-password'" is displayed

  Scenario: User can navigate to the forgot password page
    When I click on the link "Forgot Password?"
    Then I expect that the title is not "Login"
    And I expect that the element "data-test='input-email'" is displayed

  Scenario Outline: User tries to log in with invalid email
    Given I clear the inputfield "data-test='input-email'"
    When I add "<email>" to the inputfield "data-test='input-email'"
    And I click on the button "Login"
    Then I expect that element "data-test='input-email'" contains the same text as element "data-test='input-email'"
    And I expect that element "data-test='input-email'" is displayed
    And I expect that element "data-test='input-email'" is not enabled
    And I expect that cookie "session" does not contain "valid"

    Examples:
      | email               |
      |                    |  # Empty email
      | invalid-email      |  # Invalid email format

  Scenario Outline: User tries to log in with invalid password
    Given I clear the inputfield "data-test='input-password'"
    When I add "<password>" to the inputfield "data-test='input-password'"
    And I click on the button "Login"
    Then I expect that element "data-test='input-password'" contains the same text as element "data-test='input-password'"
    And I expect that element "data-test='input-password'" is displayed
    And I expect that element "data-test='input-password'" is not enabled
    And I expect that cookie "session" does not contain "valid"

    Examples:
      | password           |
      |                    |  # Empty password
      | short              |  # Less than 8 characters

  Scenario: User logs in successfully
    Given I clear the inputfield "data-test='input-email'"
    And I add "valid@example.com" to the inputfield "data-test='input-email'"
    Given I clear the inputfield "data-test='input-password'"
    And I add "validpassword" to the inputfield "data-test='input-password'"
    When I click on the button "Login"
    Then I expect that the title is not "Login"
    And I expect that cookie "session" contains "valid"
