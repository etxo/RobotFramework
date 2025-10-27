*** Settings ***
Documentation    Opens sign-in page and waits until title is visible.
#Signs in with password, waits until 'Dashboard' title is visible and takes a screenshot.
Library     SeleniumLibrary

*** Variables ***
${login-url}   https://dev-ui.citytax.app/sign-in
${email}    etxo@gmx.de
${password}    PassWord@1919
${dashboard-id}
*** Keywords ***

*** Test Cases ***
Open Login Page
    open browser    ${login-url}    chrome
#    open browser    ${login-url}    chromeheadless
    wait until element is visible   id:sign-in-page-title

Submit Credentials
    input text    id:login-email-input  ${email}     ${TRUE}
    input password    id:login-password-input   ${password}
    click button    id:login-submit-button
    wait until element is visible    tag:h1     5s
    #click element    xpath://div[@id="fuse-layout"]/div[1]/button
    #execute javascript     document.querySelector("#fuse-layout > div:nth-child(1) > button").click
    #execute javascript     document.querySelector("#fuse-settings-panel > button").click
    #wait until page contains element    id:fuse-main
    capture page screenshot
    #document.querySelector("#fuse-layout > div:nth-child(1) > button")
    #document.querySelector("#fuse-settings-panel")
    #document.querySelector("#fuse-settings-panel > button")
    #document.querySelector("#fuse-settings-panel > button.MuiButtonBase-root.MuiButton-root.MuiButton-text.MuiButton-textInherit.MuiButton-sizeMedium.MuiButton-textSizeMedium.MuiButton-colorInherit.MuiButton-root.MuiButton-text.MuiButton-textInherit.MuiButton-sizeMedium.MuiButton-textSizeMedium.MuiButton-colorInherit.settingsButton.m-0.h-9.w-9.min-w-9.muiltr-10f91v0")
    #document.querySelector("#root > div.MuiDrawer-root.flex.lg\\:hidden.MuiDrawer-modal.MuiModal-root.muiltr-fegi8q > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-elevation16.MuiDrawer-paper.flex-col.flex-auto.h-full.MuiDrawer-paperAnchorLeft.muiltr-rte6yn > div > div.flex.min-h-0.mt-6.flex-1.flex-col.muiltr-1bgtini > div > ul > div:nth-child(14) > a")
