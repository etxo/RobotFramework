*** Settings ***
Documentation   It opens login page * logs in as municipal admin * changes phone number
Resource    ../resources/common.resource

*** Variables ***
${phone_number}    +370 681 51 453

*** Test Cases ***
Change Phone Number
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Set Test Variable  ${password}  %CTdemo2025
    Submit Credentials
    Wait Until Element Is Visible   id:fuse-main

# open navbar * open settings * enter new phone number * click save
    Set Test Variable   ${navbar_item}  navbar-item-user-settings
    Open Navbar And Go To Next
    Wait Until Element Is Visible    id=account-phone-number-input
    Input Text    id=account-phone-number-input     ${phone_number}
    Click Button    id=account-save-button