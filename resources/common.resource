*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login-url}    https://dev-ui.citytax.app
${email}
#demo.guest1@citytax.xyz  demo.host1@citytax.xyz  anyksciai@citytax.xyz
${password}    %CTdemo2025

*** Keywords ***
Open Login Page
    open browser    ${login-url}    chrome
    wait until element is visible   id:sign-in-page-title

Submit Credentials
    input text    id:login-email-input  ${email}     ${TRUE}
    input password    id:login-password-input   ${password}
    click button    id:login-submit-button
    #wait until element is visible    id:fuse-main
    #Wait Until Element Contains    tag:h1    text:Dashboard