*** Settings ***
Documentation    Opens sign-in page and waits until title is visible.
#Signs in with password, waits until 'Dashboard' title is visible and takes a screenshot.
Library     SeleniumLibrary

*** Variables ***
${login-url}   https://dev-ui.citytax.app/sign-in
${email}    etxo@gmx.de
${password}    PassWord@1919
${oauth_google}   link:https://dev.citytax.app/backend-dev/oauth2/authorization/google

*** Keywords ***
Open Login Page
    open browser    ${login-url}    chrome
    wait until element is visible   id:sign-in-page-title

Submit Credentials
    input text    id:login-email-input  ${email}     ${TRUE}
    input password    id:login-password-input   ${password}
    click button    id:login-submit-button
    wait until element is visible    tag:h1     5s
    #click element    xpath://div[@id="fuse-layout"]/div[1]/button
    #execute javascript     document.querySelector("#fuse-layout > div:nth-child(1) > button").click
    #execute javascript     document.querySelector("#fuse-settings-panel > button").click
    #wait until page contains element    id:fuse-main
    capture page screenshot

Process OAuth Login
    Wait Until Element Is Visible    id:login-form
    #click link    ${oauth_google}
    Click Element    tag:a
    Wait Until Element Is Visible    jsname:SgOY7

*** Test Cases ***
Login Guest User Form
    Open Login Page
    Submit Credentials

Login Guest User Google
    Open Login Page
    Process OAuth Login
    Capture Page Screenshot