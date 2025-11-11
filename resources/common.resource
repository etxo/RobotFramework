*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${base-url}    https://dev-ui.citytax.app
${email}
${password}    %CTdemo2025
${browser}  chrome
${path-to-driver}   ${EXECDIR}/.venv/bin/chromedriver
${navbar_item}
${add-tax-rate}     municipality-tax-rate-add-button
${text}
${sleep_time}   0s

*** Keywords ***
Open Login Page
    Open Browser    ${base-url}    ${browser}  executable_path=${path-to-driver}
    #Maximize Browser Window
    Wait Until Element Is Visible   id:sign-in-page-title

Submit Credentials
    Input Text    id:login-email-input  ${email}     ${TRUE}
    Sleep   ${sleep_time}
    Input Password    id:login-password-input   ${password}
    Sleep   ${sleep_time}
    Click Button    id:login-submit-button


Open Navbar And Go To Next
    ${is_navbar_visible} =  Run Keyword And Return Status   Wait Until Element Is Visible    id:navbar-open-button
    Log     is navbar visible: ${is_navbar_visible}
    Run Keyword IF    ${is_navbar_visible}
    ...    Click Element    id:navbar-open-button
    Sleep    ${sleep_time}
    Wait Until Element Is Enabled    id:${navbar_item}
    Click Element    id:${navbar_item}

Create Tax Rate
    Wait Until Element Is Visible    id:municipality-tax-rate-add-button
    Click Element    id:municipality-tax-rate-add-button
    Input Text    id::r7:     ${text}   ${TRUE}

Add Season
    Wait Until Element Is Visible    id:user-groups-section-delete-button-bd45e0fe-2924-4ca6-a270-871ff1afecec
    Select Checkbox    id:CheckBoxOutlineBlankIcon
    Checkbox Should Be Selected    id:CheckBoxOutlineBlankIcon
    Click Button    id:season-rates-display-add-button
    Wait Until Element Is Visible    id:season-section-modal

