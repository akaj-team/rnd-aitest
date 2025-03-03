Feature: User Registration
  As a new user
  I want to be able to register for an account
  So that I can log in and use the system

  Background:
    Given I open the site "https://abc.com/register"

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

  Scenario Outline: Validate email format
    Given I am on the email input page
    When I enter "<email>" on "data-test='input-email'"
    Then I should see a error message "<message>"

    Examples:
      | email               | message          |
      | example@example.com | Email is valid   |
      | example.com         | Email is invalid |
      | example@.com        | Email is invalid |

  Scenario Outline: User tries to register with invalid email
    Given the user is on the registration page
    When the user enters "<email>" as the email address
    And the user submits the registration form
    Then the user should see an error message "<errorMessage>"

    Examples:
      | email            | errorMessage                  |
      | invalid-email    | "Please enter a valid email." |
      | user@.com        | "Please enter a valid email." |
      | user@domain..com | "Please enter a valid email." |
      | user@domain.com. | "Please enter a valid email." |
      | @domain.com      | "Please enter a valid email." |
      | user@domain.c    | "Please enter a valid email." |

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
    When I click on the button "Register"
    Then I expect that the title is "Welcome"

  Scenario: User navigates to the term of usage page
    When I click on the link "View Term Of Use"
    Then I expect that the title is "Term Of Use"
