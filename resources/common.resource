*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login-url}    https://dev-ui.citytax.app
${email}
${password}    %CTdemo2025

*** Keywords ***
Set Chrome Driver
    ${chrome_service}=  Evaluate    sys.modules['selenium.webdriver'].ChromeService(r".venv/bin/chromedriver")

Open Login Page
    [Arguments]     ${chrome_service}
    open browser    ${login-url}    chrome  service=${chrome_service}
    wait until element is visible   id:sign-in-page-title

Submit Credentials
    input text    id:login-email-input  ${email}     ${TRUE}
    input password    id:login-password-input   ${password}
    click button    id:login-submit-button

Go To User Settings
    click element    link:/user-settings
    Textarea Should Contain    tag:h2   Account Information