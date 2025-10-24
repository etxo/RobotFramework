*** Settings ***
Documentation    Opens sign-in page and waits until title is visible
Library     SeleniumLibrary

*** Variables ***
${login-url}   https://dev-ui.citytax.app/sign-in

*** Keywords ***

*** Test Cases ***
Open Login Page
    #create webdriver   chrome
    open browser    ${login-url}    chrome
    wait until element is visible   id:sign-in-page-title