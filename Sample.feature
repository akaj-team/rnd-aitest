@Register_Screen
Feature: User Registration
  As a new user
  I want to be able to register for an account
  So that I can log in and use the system

  Background:
    Given I open the user registration page "https://abc.com/"

  Scenario: User can see the registration page
    Then the element "data-test='input-username'" is displayed
    Then the element "data-test='input-email'" is displayed
    Then the element "data-test='input-password'" is displayed
    Then the element "data-test='input-confirm-password'" is displayed
    Then the element "data-test='btn-register'" is displayed
    Then the element "data-test='link-tou'" is displayed

  Scenario: User can navigate to the login page
    When I click on the link "Login"
    Then I expect that the title is "Login"
    
  Scenario: Ensure the employee name is displayed correctly
    Then the element "data-test='element-name'" is displayed
    And the element "data-test='employee-name'" matches the text "Employee Name"

  Scenario: Ensure the employee ID is displayed correctly
    Then the element "data-test='employee-id'" is displayed
    And the element "data-test='employee-id'" matches the text "Employee Code"

  Scenario Outline: Validate username and password fields
    Given I clear the inputfield "[data-test='username']"
    And I add "<username>" to the inputfield "[data-test='username']"
    Given I clear the inputfield "[data-test='password']"
    And I add "<password>" to the inputfield "[data-test='password']"
    When I click on the button "[data-test='login-button']"
    Then I expect that error message "<errorMessage>" will displayed

    Examples:
      | username | password | errorMessage                                                                |
      |          |          | Username can not empty                                        |
      | test     |          | Password can not empty                                        |
      |          | test     | Username can not empty                                        |
      | invalid  | invalid  | Username and password do not match any user in database |

  Scenario Outline: User tries to register with invalid email
    Given the user is on the registration page
    When the user enters "<email>" as the email address
    And the user submits the registration form
    Then the user should see an error message "<errorMessage>"

    Examples:
      | email            | errorMessage                  |
      | invalid-email    | Please enter a valid email. |
      | user@.com        | Please enter a valid email. |
      | user@domain..com | Please enter a valid email. |
      | user@domain.com. | Please enter a valid email. |
      | @domain.com      | Please enter a valid email. |
      | user@domain.c    | Please enter a valid email. |

  Scenario Outline: User tries to register with invalid password
    Given the user is on the registration page
    When the user enters "<username>" as username
    And the user enters "<password>" as password
    And the user submits the registration form
    Then the user should see an error message "<error_message>"

    Examples:
      | username | password  | error_message                                       |
      | user1    |       123 | Password must be at least 6 characters long         |
      | user2    | abc       | Password must be at least 6 characters long         |
      | user3    | password  | Password must contain at least one number           |
      | user4    | Password1 | Password must contain at least one lowercase letter |
      | user5    | PASSWORD1 | Password must contain at least one lowercase letter |
      | user6    | pass1234  | Password must contain at least one uppercase letter |

  Scenario: User successfully registers
    Given I clear the inputfield "data-test='input-username'"
    And I add "valid_username" to the inputfield "data-test='input-username'"
    Given I clear the inputfield "data-test='input-email'"
    And I add "valid@example.com" to the inputfield "data-test='input-email'"
    Given I clear the inputfield "data-test='input-password'"
    And I add "validpassword" to the inputfield "data-test='input-password'"
    Given I clear the inputfield "data-test='input-confirm-password'"
    And I add "validpassword" to the inputfield "data-test='input-confirm-password'"
    When I click on the button "data-test='button-register'"
    Then I expect that the title is "Welcome"

  Scenario: User navigates to the term of usage page
    When I click on the link "View Term Of Use"
    Then I expect that the title is "Term Of Use"
