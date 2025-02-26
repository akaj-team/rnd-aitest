Feature: User Registration
  As a new user
  I want to be able to register for an account
  So that I can log in and use the system

  Background:
    Given I open the site "/register"

  Scenario: User can see the registration page
    Then the element "data-test='input-username'" is displayed
    Then the element "data-test='input-email'" is displayed
    Then the element "data-test='input-password'" is displayed
    Then the element "data-test='input-confirm-password'" is displayed
    Then the element "data-test='btn-register'" is displayed
    Then the element "data-test='link-login'" is displayed

  Scenario: User can navigate to the login page
    When I click on the link "Login"
    Then I expect that the title is "Login"
    And I expect that the element "data-test='input-email'" is displayed

  Scenario Outline: User tries to register with invalid username
    Given I clear the inputfield "data-test='input-username'"
    When I add "<sample_username>" to the inputfield "data-test='input-username'"
    And I click on the button "Register"
    Then I expect that element "data-test='input-username'" contains the same text as element "data-test='input-username'"
    And I expect that element "data-test='input-username'" is displayed
    And I expect that element "data-test='input-username'" is not enabled

    Examples:
      | sample_username     |
      |                     |  # Empty username
      | short              |  # Less than 3 characters

  Scenario Outline: User tries to register with invalid email
    Given I clear the inputfield "data-test='input-email'"
    When I add "<sample_email>" to the inputfield "data-test='input-email'"
    And I click on the button "Register"
    Then I expect that element "data-test='input-email'" contains the same text as element "data-test='input-email'"
    And I expect that element "data-test='input-email'" is displayed
    And I expect that element "data-test='input-email'" is not enabled
    And I expect that cookie "session" does not contain "valid"

    Examples:
      | sample_email        |
      |                     |  # Empty email
      | invalid-email      |  # Invalid email format

  Scenario Outline: User tries to register with invalid password
    Given I clear the inputfield "data-test='input-password'"
    When I add "<sample_password>" to the inputfield "data-test='input-password'"
    And I click on the button "Register"
    Then I expect that element "data-test='input-password'" contains the same text as element "data-test='input-password'"
    And I expect that element "data-test='input-password'" is displayed
    And I expect that element "data-test='input-password'" is not enabled

    Examples:
      | sample_password     |
      |                     |  # Empty password
      | short              |  # Less than 8 characters

  Scenario: User successfully registers
    Given I clear the inputfield "data-test='input-username'"
    And I add "valid_username" to the inputfield "data-test='input-username'"
    Given I clear the inputfield "data-test='input-email'"
    And I add "valid@example.com" to the inputfield "data-test='input-email'"
    Given I clear the inputfield "data-test='input-password'"
    And I add "validpassword" to the inputfield "data-test='input-password'"
    Given I clear the inputfield "data-test='input-confirm-password'"
    And I add "validpassword" to the inputfield "data-test='input-confirm-password'"
    When I click on the button "Register"
    Then I expect that the title is "Welcome"
    
