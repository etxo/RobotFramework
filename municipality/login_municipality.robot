*** Settings ***
Resource    ../resources/common.resource

*** Test Cases ***
Login Municipality
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Log    email : ${email}
    Submit Credentials
    #Sleep    1s
    Wait Until Element Is Visible   id:fuse-main

    Capture Page Screenshot
    Close Browser