*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login-url}    https://dev-ui.citytax.app
${email}
${password}    %CTdemo2025
${browser}  chrome
${path-to-driver}   ${EXECDIR}/.venv/bin/chromedriver

*** Keywords ***
Open Login Page
    open browser    ${login-url}    ${browser}  executable_path=${path-to-driver}
    #Maximize Browser Window
    wait until element is visible   id:sign-in-page-title

Submit Credentials
    input text    id:login-email-input  ${email}     ${TRUE}
    input password    id:login-password-input   ${password}
    click button    id:login-submit-button


Go To User Settings
    ${is_navbar_visible}=   Element Should Be Visible    id:
    Run Keyword If    ${is_navbar_visible}
    ...    Click Button    id:
    ...  ELSE
    ...    Click Button    id:
    #Textarea Should Contain    tag:h2   Account Information