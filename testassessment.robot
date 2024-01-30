*** Settings ***

Resource          keyword_driven.robot

*** Test Cases ***
Scenario: Submitting a new application
    Given the user is on the URL "provided"
    When the user logs in using the "credentials" provided
    And the user clicks the "Submit a new application" button
    And user clicks Continue with the submission of the application
    And the user fills out the forms
    And the user clicks the "Next screen" button
    And all the inputted values are displayed in the Summary screen
    And the user clicks the "Validate and send" button
    Then the user is redirected to the "Thank you for submitting your project" page
