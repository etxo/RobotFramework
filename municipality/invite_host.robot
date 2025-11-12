*** Settings ***
Documentation   It opens login page * logs in as municipal admin * invites a host
Resource    ../resources/common.resource

*** Variables ***
${host_email}    maugli@citytax.xyz
${invite-message}    Welcome to our registration platform!

*** Test Cases ***
Invite Host
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Set Test Variable  ${password}  %CTdemo2025
    Submit Credentials
    Wait Until Element Is Visible   id:fuse-main

# open navbar * open hosts * click invite hosts * select manual entry
    Set Test Variable   ${navbar_item}  navbar-item-municipality-host-page
    Open Navbar And Go To Next
    Wait Until Element Is Visible    id=municipality-hosts-invite-button
    Click Button    id=municipality-hosts-invite-button
    Wait Until Element Is Visible    id=invite-hosts-method-label
    Click Element    id=invite-hosts-manual-option

# enter email * enter invitation message
    Input Text    id=invite-hosts-emails-input    ${host_email}
    Input Text    id=invite-hosts-message-input    ${invite-message}
    Click Button    id=invite-hosts-send-button
    Sleep    5s
