*** Settings ***
Library           SeleniumLibrary

*** Variables ***


*** Keywords ***
Given the user is on the URL "provided"
    Open Browser    https://qrqck8u5t9co.front.staging.optimy.net/en/    Chrome
    Wait Until Element Is Visible    css=#cookie-close    10s
    Click Element    css=#cookie-close
When the user logs in using the "credentials" provided
    Wait Until Element Is Visible    css=a.ml-auto    10s
    Click Element    css=a.ml-auto
    Wait Until Element Is Visible    css=#login-email    10s
    Input Text    css=#login-email    optimyautomationtester@gmail.com
    Input Password    css=#login-password    2MsWseoj
    Click Element    css=button.btn-lg:nth-child(2)

And the user clicks the "Submit a new application" button
    Wait Until Element Is Visible    css=a.btn    10s
    Click Element    css=a.btn

And user clicks Continue with the submission of the application
    Wait Until Element Is Visible    css=li.card:nth-child(1) > a:nth-child(3)    10s
    Click Element    css=li.card:nth-child(1) > a:nth-child(3)

And the user fills out the forms
    Wait Until Element Is Visible    css=[aria-label="First name"]    10s
    Input Text    css=[aria-label="First name"]    Marie
    Input Text    css=[aria-label="Last name"]    Bermingfield
    Input Text    css=[aria-label="Unit no/House no, Street"]    777 Brockton Avenue

And the user clicks the "Next screen" button
    Scroll Element Into View    css=#navButtonNext
    Sleep    3s
    Click Element    css=#navButtonNext
    Sleep    5s

And all the inputted values are displayed in the Summary screen
    Page Should Contain    Marie
    Page Should Contain    Bermingfield
    Page Should Contain    777 Brockton Avenue


And the user clicks the "Validate and send" button
    Click Element    css=button.ml-md-auto

Then the user is redirected to the "Thank you for submitting your project" page
    Page Should Contain    Thank you for submitting your project

And the user clicks the Submit a new application button at the bottom
    Click Button    Submit New Application

Scroll To Element
    [Arguments]    ${locator}
    Execute JavaScript    window.scrollBy({{behavior: 'smooth', left: 0, top: (document.querySelector('${locator}').getBoundingClientRect().top + window.scrollY - 100)}})