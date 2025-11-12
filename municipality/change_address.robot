*** Settings ***
Documentation   It opens login page * logs in as municipal admin * changes address
Resource    ../resources/common.resource

*** Variables ***
${street}   Parko g. 14
${zip}  29113

*** Test Cases ***
Change Address
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Set Test Variable  ${password}  %CTdemo2025
    Submit Credentials
    Wait Until Element Is Visible   id:fuse-main

# open navbar * open settings * enter new address * click save
    Set Test Variable   ${navbar_item}  navbar-item-user-settings
    Open Navbar And Go To Next
    Wait Until Element Is Visible    id=user-settings-address-tab
    Click Button    id=user-settings-address-tab
    Input Text  id=main-street-input    ${street}
    Input Text  id=main-postal-code-input   ${zip}
    Sleep   1s
    Click Button    id=main-save-button

# open main address
    #Wait Until Element Is Enabled