*** Settings ***
Resource    ../resources/common.resource

*** Test Cases ***
Login Municipality And Open Tax Rate
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Log    email : ${email}
    Submit Credentials
    #Sleep    1s
    Wait Until Element Is Visible   id:fuse-main

    Open Navbar And Go To Next
    Capture Page Screenshot
    Close Browser