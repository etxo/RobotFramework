*** Settings ***
Resource    ../resources/common.resource

*** Test Cases ***
Login Host
    Open Login Page
    Set Test Variable  ${email}    demo.host1@citytax.xyz
    Log    email : ${email}
    Submit Credentials
    Sleep    1s
    Wait Until Element Is Visible   id:fuse-main
    Capture Page Screenshot
