@Register_Screen
Feature: User Registration
  As a new user
  I want to be able to register for an account
  So that I can log in and use the system

  Background:
    Given I open the url "https://abc.com/"

  Scenario: User can see the registration page
    Then I expect that the element "[data-test='input-username']" is displayed
    Then I expect that the element "[data-test='input-email']" is displayed
    Then I expect that the element "[data-test='input-password']" is displayed
    Then I expect that the element "[data-test='input-confirm-password']" is displayed
    Then I expect that the element "[data-test='btn-register']" is displayed
    Then I expect that the element "[data-test='link-tou']" is displayed

  Scenario: User can navigate to the login page
    When I click on the link "Login"
    Then I expect that the title is "Login"

  Scenario: Ensure the employee name is displayed correctly
    Then the element "[data-test='element-name']" is displayed
    And the element "[data-test='employee-name']" matches the text "Employee Name"

  Scenario: Ensure the employee ID is displayed correctly
    Then the element "[data-test='employee-id']" is displayed
    And the element "[data-test='employee-id']" matches the text "Employee Code"

  Scenario Outline: Validate username and password fields
    Given I clear the inputfield "[data-test='username']"
    And I add "<username>" to the inputfield "[data-test='username']"
    Given I clear the inputfield "[data-test='password']"
    And I add "<password>" to the inputfield "[data-test='password']"
    When I click on the button "[data-test='login-button']"
    Then I expect that element "[data-test='error-button']" matches the text "<errorMessage>"

    Examples:
      | username | password | errorMessage                                            |
      |          |          | Username can not empty                                  |
      | test     |          | Password can not empty                                  |
      |          | test     | Username can not empty                                  |
      | invalid  | invalid  | Username and password do not match any user in database |

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
    Given I clear the inputfield "[data-test='input-username']"
    And I add "valid_username" to the inputfield "[data-test='input-username']"
    Given I clear the inputfield "[data-test='input-email']"
    And I add "valid@example.com" to the inputfield "[data-test='input-email']"
    Given I clear the inputfield "[data-test='input-password']"
    And I add "validpassword" to the inputfield "[data-test='input-password']"
    Given I clear the inputfield "[data-test='input-confirm-password']"
    And I add "validpassword" to the inputfield "[data-test='input-confirm-password']"
    When I click on the button "[data-test='button-register']"
    Then I expect that the title is "Welcome"

  Scenario: User navigates to the term of usage page
    When I click on the link "View Term Of Use"
    Then I expect that the title is "Term Of Use"

  Scenario: click on link
    Given the title is not "two"
    And I open the url "http://guinea-pig.webdriver.io/"
    When I click on the link "two"
    Then I expect that the title is "two"

  Scenario: click on button
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the element "[data-test='btn1_clicked']" is not displayed
    When I click on the button "[data-test='btn1']"
    Then I expect that element "[data-test='btn1_clicked']" is displayed

  Scenario: double click on a button
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the element "[data-test='btn1'_dblclicked" is not displayed
    When I doubleclick on the element "[data-test='btn1']"
    Then I expect that element "[data-test='btn1'_dblclicked" is displayed

  Scenario: click on element
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the element "[data-test='btn1_clicked']" is not displayed
    When I click on the element "[data-test='btn1']"
    Then I expect that element "[data-test='btn1_clicked']" is displayed

  Scenario: add value to an input element
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the element "//html/body/section/form/input[1]" not contains the text "abc"
    When I add "bc" to the inputfield "//html/body/section/form/input[1]"
    Then I expect that element "//html/body/section/form/input[1]" contains the text "abc"

  Scenario: set value to an input element
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the element "//html/body/section/form/input[1]" not contains the text "bc"
    When I set "bc" to the inputfield "//html/body/section/form/input[1]"
    Then I expect that element "//html/body/section/form/input[1]" contains the text "bc"

  Scenario: clear value of input element
    Given I open the url "http://guinea-pig.webdriver.io/"
    When I set "test" to the inputfield "//html/body/section/form/input[1]"
    And I clear the inputfield "//html/body/section/form/input[1]"
    Then I expect that element "//html/body/section/form/input[1]" not contains any text

  Scenario: wait for element
    Given I open the url "http://guinea-pig.webdriver.io/"
    And there is no element "[data-test='lateElem']" on the page
    Then I wait on element "[data-test='lateElem']" for 5000ms to be displayed

  Scenario: query title
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the title is "WebdriverJS Testpage"
    And the title is not "Other title"
    Then I expect that the title is "WebdriverJS Testpage"
    And I expect that the title is not "Other title"

  Scenario: check visibility
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the element "[data-test='btn1']" is displayed
    And the element "[data-test='btn1_clicked']" is not displayed
    Then I expect that element "[data-test='btn1']" is displayed
    And I expect that element "[data-test='btn1_clicked']" is not displayed

  Scenario: compare texts
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the element "[data-test='secondPageLink']" contains the same text as element "[data-test='secondPageLink']"
    And the element "[data-test='secondPageLink']" contains not the same text as element "[data-test='githubRepo']"
    Then I expect that element "[data-test='secondPageLink']" contains the same text as element "[data-test='secondPageLink']"
    And I expect that element "[data-test='secondPageLink']" not contains the same text as element "[data-test='githubRepo']"

  Scenario: check text content
    Given I open the url "http://guinea-pig.webdriver.io/"
    And the element "[data-test='secondPageLink']" contains the text "two"
    And the element "[data-test='secondPageLink']" not contains the text "andere linktext"
    Then I expect that element "[data-test='secondPageLink']" contains the text "two"
    And I expect that element "[data-test='secondPageLink']" not contains the text "anderer linktext"
