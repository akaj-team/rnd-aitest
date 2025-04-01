@Register_Screen
Feature: User Registration
  As a new user
  I want to be able to register for an account
  So that I can log in and use the system

  Background:
    Given I open the url "https://abc.com/"

  Scenario: User can see the registration page
    Then I expect that element "[data-test='input-username']" is displayed
    Then I expect that element "[data-test='input-email']" is displayed
    Then I expect that element "[data-test='input-password']" is displayed
    Then I expect that element "[data-test='input-confirm-password']" is displayed
    Then I expect that element "[data-test='btn-register']" is displayed
    Then I expect that element "[data-test='link-tou']" is displayed

  Scenario: User can navigate to the login page
    When I click on the link "Login"
    Then I expect that the title is "Login"

  Scenario: Ensure the employee name is displayed correctly
    Then the element "[data-test='element-name']" is displayed
    And the element "[data-test='employee-name']" matches the text "Employee Name"

  Scenario: Ensure the employee ID is displayed correctly
    Then the element "[data-test='employee-id']" is displayed
    And the element "[data-test='employee-id']" matches the text "Employee Code"

  Scenario: Ensure the place holder of username input field is displayed correctly
    Given the element "[data-test='input-username']" is displayed
    Then I expect that the attribute "placeholder" from element "[data-test='input-username']" is "Please Input Username"
    
  Scenario: Ensure the place holder of password input field is displayed correctly
    Given the element "[data-test='input-password']" is displayed
    Then I expect that the attribute "placeholder" from element "[data-test='input-password']" is "Please Input Password"

  Scenario Outline: User tries to log in with invalid credentials
    Given I add "<username>" to the inputfield "[data-test='username']"
    And I add "<password>" to the inputfield "[data-test='password']"
    Then I click on the button "[data-test='login-button']"
    Then I expect that element "[data-test='error']" matches the text "<message>"

    Examples:
      | username | password | message                                                             |
      |          |          | Username is required                                        |
      | user1    |          | Password is required                                        |
      | user1    | user2    | Username and password do not match any user in this service |

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

  # Scenario to check each element of the item of the list are displayed
  Scenario Outline: Check the items of list are displayed
    Given I expect that element "<item_title_selector>" is displayed
    And I expect that element "<item_time_selector>" is displayed
    And I expect that element "<item_image_selector>" is displayed
    Examples:
      | item_title_selector        | item_time_selector        | item_image_selector        |
      | [data-test='item-title-1'] | [data-test='item-time-1'] | [data-test='item-image-1'] |
      | [data-test='item-title-2'] | [data-test='item-time-2'] | [data-test='item-image-2'] |
      | [data-test='item-title-3'] | [data-test='item-time-3'] | [data-test='item-image-3'] |
      | [data-test='item-title-4'] | [data-test='item-time-4'] | [data-test='item-image-4'] |
      | [data-test='item-title-5'] | [data-test='item-time-5'] | [data-test='item-image-5'] |
      | [data-test='item-title-6'] | [data-test='item-time-6'] | [data-test='item-image-6'] |
 
  # Scenario to validate the content of each element of the item of the list
  Scenario Outline: Validate content of each element of the item of the list are display with correct content
    Given I expect that element "<item_title_selector>" is displayed
    And I expect that element "<item_time_selector>" is displayed
    And I expect that element "<item_image_selector>" is displayed
    And I expect that element "<item_time_selector>" contains the text "<expected_time_content_display>"
    And I expect that element "<item_title_selector>" contains the text "<expected_title_content_display>"
    And I expect that the attribute "src" from element "<item_image_selector>" is "<expected_image_src_display>"
    Examples:
      | item_title_selector        | item_time_selector        | item_image_selector        | expected_time_content_display  | expected_title_content_display           | expected_image_src_display    |
      | [data-test='item-title-1'] | [data-test='item-time-1'] | [data-test='item-image-1'] | "5 hours ago"  | "When The Morning Dawns - DJ Silver Club Remix"          | "https://example.com/moon_image"      |
      | [data-test='item-title-2'] | [data-test='item-time-2'] | [data-test='item-image-2'] | "3 hours ago"  | "Cheap Airline Tickets Great Ways To Save"               | "https://example.com/person_image"    |
      | [data-test='item-title-3'] | [data-test='item-time-3'] | [data-test='item-image-3'] | "7 hours ago"  | "Vacation Home Rental Success"                           | "https://example.com/cabin_image"     |
      | [data-test='item-title-4'] | [data-test='item-time-4'] | [data-test='item-image-4'] | "5 hours ago"  | "Cruising Destination Ideas"                             | "https://example.com/mountains_image" |
      | [data-test='item-title-5'] | [data-test='item-time-5'] | [data-test='item-image-5'] | "15 hours ago" | "Global Resorts Network Grn Putting Timeshares To Shame" | "https://example.com/piano_image"     |
      | [data-test='item-title-6'] | [data-test='item-time-6'] | [data-test='item-image-6'] | "7 hours ago"  | "Vacation Home Rental Success"                           | "https://example.com/mountains_image" |
  
  # Scenario to check the total number item of the list
  Scenario: Check the sample list item count
    Then I expect that element "[data-test='sample-list']" does appear exactly "6" times
