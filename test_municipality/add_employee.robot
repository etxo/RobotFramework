*** Settings ***
Resource    ../resources/common.resource

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
    Click Element   xpath://*[@data-value="ROLE_MUNICIPALITY_MANAGER"]
    Element Should Contain  xpath=//*[@id="employee-form-container"]/div[1]/div/div    Municipality Manager
    # enter name * phone * email
    Input Text    id:employee-form-first-name-input    Arturo
    Input Text    id:employee-form-last-name-input    Arturianis
    Input Text    id:employee-form-phone-input    +370 312 34567
    Input Text    id:employee-form-email-input    arturart@citytax.xyz
    #Click Button    id:employee-form-submit-button
    # goes to employees page and checks if the new one is saved correctly
    Go To    ${base-url}/employees
    Wait Until Element Is Visible    id:table-row-3a9de3c4-e6f0-4480-9e89-ccf3df9d7b69
    Element Should Contain    id:table-cell-3a9de3c4-e6f0-4480-9e89-ccf3df9d7b69-fullName    Arturo Arturianis
    Element Should Contain    id:table-cell-3a9de3c4-e6f0-4480-9e89-ccf3df9d7b69-displayEmail    arturart@citytax.xyz
    Element Should Contain    id:table-cell-3a9de3c4-e6f0-4480-9e89-ccf3df9d7b69-displayPhone    +370 312 34567
    Capture Page Screenshot
    Close Browser