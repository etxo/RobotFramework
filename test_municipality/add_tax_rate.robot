*** Settings ***
Resource    ../resources/common.resource
Library    BuiltIn
Library    DateTime

*** Test Cases ***
Login Municipality And Add Tax Rate
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Log    email : ${email}
    Submit Credentials
    Wait Until Element Is Visible   id:navbar-item-home-route
# open navbar and go to
    Set Test Variable    ${navbar_item}    navbar-item-tax-rate-creation
    Open Navbar And Go To Next
    Wait Until Element Is Visible    id:municipality-tax-rate-add-button
    Click Button    id:municipality-tax-rate-add-button
# select user group and push 'Add Season'
    Wait Until Element Is Visible   xpath=//*[@data-testid="user-groups-section-group-checkbox-bd45e0fe-2924-4ca6-a270-871ff1afecec"]
    Click Element    xpath=//*[@data-testid="user-groups-section-group-checkbox-bd45e0fe-2924-4ca6-a270-871ff1afecec"]
    Sleep    1s
    Click Button    id:season-rates-display-add-button
    Wait Until Element Is Visible    xpath=//*[@data-testid="seasons-section-modal-title"]
# fill out season form
    Input Text    xpath=//*[@data-testid="season-form-name-input"]    Main
    Input Text    xpath=//*[@data-testid="season-form-start-date-input"]    0501
    Input Text    xpath=//*[@data-testid="season-form-end-date-input"]    0930
    Input Text    xpath=//*[@data-testid="season-form-tax-rate-input-bd45e0fe-2924-4ca6-a270-871ff1afecec"]    1.5
    Click Button    id:season-form-submit-button
    Element Should Contain    xpath=//*[@data-testid="season-rates-display-season-name-null"]    Main
# fill out tax rate form
    Input Text    xpath=//*[@data-testid="basic-info-display-tax-rate-name-input"]    Happy Season
    #Click Element    xpath=//*[@data-testid="CalendarTodayIcon"]
    ${date} =   Get Current Date
    Input Text    xpath=//*[@data-testid="basic-info-display-date-from-input"]  ${date}
    Click Button    id:municipality-tax-rate-creation-button

    Capture Page Screenshot
    Close Browser