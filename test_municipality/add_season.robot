*** Settings ***
Resource    ../resources/common.resource

*** Test Cases ***
Login Municipality And Add Season
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Log    email : ${email}
    Submit Credentials
    Wait Until Element Is Visible   id:fuse-main

    Set Test Variable    ${navbar_item}    navbar-item-tax-rate-creation
    Open Navbar And Go To Next
    Wait Until Element Is Visible    id:user-groups-section-delete-button-bd45e0fe-2924-4ca6-a270-871ff1afecec
    Select Checkbox    id:CheckBoxOutlineBlankIcon
    Checkbox Should Be Selected    id:CheckBoxOutlineBlankIcon
    Click Button    id:season-rates-display-add-button
    Wait Until Element Is Visible    id:season-section-modal

    Capture Page Screenshot
    Close Browser