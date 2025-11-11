*** Settings ***
Resource    ../resources/common.resource

*** Variables ***
@{manager_email}

*** Test Cases ***
Login Municipality And Add Employee
    Open Login Page
    Set Test Variable  ${email}    anyksciai@citytax.xyz
    Log    email : ${email}
    Submit Credentials
    Wait Until Element Is Visible   id:fuse-main
# open navbar * open employee * click add employee
    Set Test Variable   ${navbar_item}  navbar-item-municipality-employee-page
    Open Navbar And Go To Next
    Wait Until Element Is Visible    id:municipality-employees-page-title
    Click Button    id:municipality-employees-add-button
    Wait Until Element Is Visible    id:employee-form-container
# select role 'municipality manager'
    Click Element    xpath=//*[@aria-labelledby="employee-form-role-select-label"]
    Click Element   xpath=//*[@data-value="ROLE_MUNICIPALITY_MANAGER"]
    Element Should Contain  xpath=//*[@id="employee-form-container"]/div[1]/div/div    Municipality Manager
# enter name * phone * email
    
    Input Text    id:employee-form-first-name-input    Arturo
    Input Text    id:employee-form-last-name-input    Arturianis
    Input Text    id:employee-form-phone-input    +370 312 34567
    Set Test Variable    ${manager_email}   arturart@citytaxd.xyz
    Input Text    id:employee-form-email-input    text=${manager_email}
    #Capture Page Screenshot
    #Click Button    id:employee-form-submit-button
# goes to employees page search bar and checks if the new one is saved
    Go To    ${base-url}/employees
    Wait Until Element Is Visible    xpath=//*[@id=":r3:"]
    Input Text    xpath=//*[@id=":r3:"]    text=${manager_email}
    Page Should Contain Element    xpath=//*[@id="municipality-employees-table"]/div/div[3]/div/p[2]

    Capture Page Screenshot
    Close Browser