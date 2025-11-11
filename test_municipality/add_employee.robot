*** Settings ***
Resource    ../resources/common.resource

*** Test Cases ***
Login Municipality And Add Employee
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Log    email : ${email}
    Submit Credentials
    Wait Until Element Is Visible   id:fuse-main

    Set Test Variable