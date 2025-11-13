*** Settings ***
Resource    ../resources/common.resource
Resource    ../resources/tax_rate.resource
Library    BuiltIn
Library    DateTime



*** Test Cases ***
Login Municipality And Add Tax Rate
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Set Test Variable    ${password}    %CTdemo2025
    Log    email : ${email}
    Submit Credentials
    Wait Until Element Is Visible   id:navbar-item-home-route
# open navbar and go to
    Set Test Variable    ${navbar_item}    navbar-item-tax-rate-creation
    Open Navbar And Go To Next
    Wait Until Element Is Visible    id:municipality-tax-rate-add-button
    Click Button    id:municipality-tax-rate-add-button

# select user groups
    Wait Until Element Is Visible   xpath=//*[@data-testid="user-groups-section-group-checkbox-bd45e0fe-2924-4ca6-a270-871ff1afecec"]
    Click Element    xpath=//*[@data-testid="user-groups-section-group-checkbox-bd45e0fe-2924-4ca6-a270-871ff1afecec"]
    Click Element    xpath=//*[@data-testid="user-groups-section-group-checkbox-7d8273c9-7f5e-47b9-9c61-ccbf2bc852bd"]
# determine if seasons are present
    ${seasons_empty} =  Run Keyword And Return Status   Wait Until Element Is Visible    xpath=//*[@data-testid="season-rates-display-empty-message"]  1s
    Log    no seasons: ${seasons_empty}
    #Run Keyword IF    ${seasons_empty}
    #...    Click Element    id:navbar-open-button
# add main season
    Set Test Variable    ${season_name}  Main
    Log    Season: ${season_name}
    Set Test Variable    ${season_start}    0601
    Set Test Variable    ${season_end}   0930
    Set Test Variable    ${price_child}    1.0
    Set Test Variable    ${price_adult}    2.5
    Add Season

# add off season
    Set Test Variable    ${season_name}  Off
    Log    Season: ${season_name}
    Set Test Variable    ${season_start}    1001
    Set Test Variable    ${season_end}   0531
    Set Test Variable    ${price_child}    0.5
    Set Test Variable    ${price_adult}    1
    Add Season

# fill out tax rate form
    Input Text    xpath=//*[@data-testid="basic-info-display-tax-rate-name-input"]    Happy Season
    #Click Element    xpath=//*[@data-testid="CalendarTodayIcon"]
    ${date} =   Get Current Date    result_format=%d/%M/%Y
    Log    date: ${date}
    Input Text    xpath=//*[@data-testid="basic-info-display-date-from-input"]  ${date}    ${True}
    Sleep    1s
    Click Button    id:municipality-tax-rate-creation-button

    Capture Page Screenshot
    Close Browser