*** Settings ***
Documentation   Processes signing in with google
Library   SeleniumLibrary

*** Variables ***
${login-url}   https://dev-ui.citytax.app/sign-in
${google-email}     etxotono@gmail.com

*** Keywords ***
Open Login Page
    open browser    ${login-url}    chrome
    wait until element is visible   id:sign-in-page-title

Process Google Login
    Wait Until Element Is Visible    id:login-form  3s
    Click Element    id:google-login-button
    Wait Until Element Is Visible    id:yDmH0d
    Sleep    1s
    Input Text    id:identifierId    ${google-email}   ${TRUE}
    Sleep    1s
    Click Element   id:identifierNext
    Wait Until Element Is Visible    id:password

*** Test Cases ***
Login Guest With Google
    Open Login Page
    Process Google Login
    Capture Page Screenshot