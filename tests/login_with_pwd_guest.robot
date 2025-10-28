*** Settings ***
Documentation    Opens sign-in page and waits until title is visible.
#Signs in with password, waits until 'Dashboard' title is visible and takes a screenshot.
Library     SeleniumLibrary

*** Variables ***
${login-url}   https://dev-ui.citytax.app/sign-in
${email}    etxo@gmx.de
${password}    PassWord@1919
${google-email}     etxotono@gmail.com

*** Keywords ***
Open Login Page
    open browser    ${login-url}    chrome
    wait until element is visible   id:sign-in-page-title

Submit Credentials
    input text    id:login-email-input  ${email}     ${TRUE}
    input password    id:login-password-input   ${password}
    click button    id:login-submit-button
    wait until element is visible    tag:h1     5s

Process OAuth Login
    Wait Until Element Is Visible    id:login-form  3s
    Click Element    id:google-login-button
    Wait Until Element Is Visible    id:yDmH0d
    #Click Element   xpath=//*[@id="yDmH0d"]/div[1]/div[2]/footer/div/div/div
    #Click Element    class:VfPpkd-aPP78e
    Click Element    class:
    Input Text    class:whsOnd    ${google-email}   ${TRUE}
    Click Button    class:VfPpkd-LgbsSe


*** Test Cases ***
Login Guest User Form
    Open Login Page
    Submit Credentials
    capture page screenshot

Login Guest User Google
    Open Login Page
    Process OAuth Login
    Capture Page Screenshot