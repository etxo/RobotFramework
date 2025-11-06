*** Settings ***
Documentation   Processes signing in with google
Library    SeleniumLibrary
Library    String

*** Variables ***
${login-url}   https://dev-ui.citytax.app/sign-in
${google-email}     etxotono@gmail.com
${profile-path}     home/etxo/.cache/google-chrome/Default

*** Keywords ***
Open Profiled Browser
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method     ${chrome_options}    add_argument    --allow-running-insecure-content
    #Call Method     ${chrome_options}    add_argument    --disable-web-security
    Call Method     ${chrome_options}    add_argument    --user-data-dir\=${profile-path}
    Create Webdriver    Chrome         executable_path=${EXECDIR}/.venv/bin/chromedriver    options=${chrome_options}

Login From Profile
    Go To    ${login-url}
    wait until element is visible   id:sign-in-page-title
    Sleep    3s

*** Test Cases ***
Open Browser From Profile
    Open Profiled Browser
    #Login From Profile
    Capture Page Screenshot
    Close Browser