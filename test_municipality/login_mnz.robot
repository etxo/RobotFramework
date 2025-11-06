*** Settings ***
Resource    ../resources/common.resource

*** Test Cases ***
Login Municipality
    ${chrome_service}=  Evaluate    sys.modules['selenium.webdriver'].ChromeService(r".venv/bin/chromedriver")
    Open Login Page     ${chrome_service}
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Log    email : ${email}
    Submit Credentials
    Sleep    1s
    Wait Until Element Is Not Visible   id:fuse-main

    Go To User Settings
    Capture Page Screenshot