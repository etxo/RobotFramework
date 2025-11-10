*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login-url}    https://dev-ui.citytax.app
${email}
${password}    %CTdemo2025
${browser}  chrome
${path-to-driver}   ${EXECDIR}/.venv/bin/chromedriver
${tax-rate}    navbar-item-tax-rate-creation
${add-tax-rate}     municipality-tax-rate-add-button
${sleep_time}   0s

*** Keywords ***
Open Login Page
    open browser    ${login-url}    ${browser}  executable_path=${path-to-driver}
    #Maximize Browser Window
    wait until element is visible   id:sign-in-page-title

Submit Credentials
    input text    id:login-email-input  ${email}     ${TRUE}
    Sleep   ${sleep_time}
    input password    id:login-password-input   ${password}
    Sleep   ${sleep_time}
    click button    id:login-submit-button


Open Navbar And Go To Next
    ${is_navbar_visible} =  Run Keyword And Return Status   Wait Until Element Is Visible    id:navbar-open-button
    Log     is navbar visible: ${is_navbar_visible}
    Run Keyword IF    ${is_navbar_visible}
    ...    Click Element    id:navbar-open-button
    Sleep    ${sleep_time}
    Wait Until Element Is Enabled    id:${tax-rate}
    Click Element    id:${tax-rate}
    Wait Until Element Is Visible    id:${add-tax-rate}