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
    Add Season

    Capture Page Screenshot
    Close Browser