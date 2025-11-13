*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${season_name}
${season_start}
${season_end}
${price_child}
${price_adult}
${group_name_native}
${group_name_en}
${age_from}
${age_to}

*** Keywords ***
Add Season
# click add season
    Click Button    id:season-rates-display-add-button
    Wait Until Element Is Visible    xpath=//*[@data-testid="seasons-section-modal-title"]
# fill out season form
    Input Text    xpath=//*[@data-testid="season-form-name-input"]    ${season_name}
    Input Text    xpath=//*[@data-testid="season-form-start-date-input"]    ${season_start}
    Input Text    xpath=//*[@data-testid="season-form-end-date-input"]    ${season_end}
    Input Text    xpath=//*[@data-testid="season-form-tax-rate-input-bd45e0fe-2924-4ca6-a270-871ff1afecec"]    ${price_adult}
    Input Text    xpath=//*[@data-testid="season-form-tax-rate-input-7d8273c9-7f5e-47b9-9c61-ccbf2bc852bd"]    ${price_child}
    Click Button    id:season-form-submit-button
    #Element Should Contain    xpath=//*[@data-testid="season-rates-display-season-name-null"]    ${season_name}

Add User Group
    Click Button    id=user-groups-section-add-button
    Wait Until Element Is Visible    xpath=//*[@data-testid="user-groups-section-modal-title"]
    Input Text    xpath=//*[@data-testid="user-group-form-title-native-input"]    ${group_name_native}
    Input Text    xpath=//*[@data-testid="user-group-form-title-en-input"]    ${group_name_en}
    Input Text    xpath=//*[@data-testid="user-group-form-age-from-input"]    ${age_from}
    Input Text    xpath=//*[@data-testid="user-group-form-age-to-input"]    ${age_to}


