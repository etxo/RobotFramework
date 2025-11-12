*** Settings ***
Library     REST

*** Variables ***
${base-url}    https://dev-ui.citytax.app
${get-users} =  https://dev-ui.citytax.app/employees
${login} =  {"email": "anyksciai@citytax.xyz", "password": "%CTdemo2025"}

*** Tasks ***
Retrieve Last Registered Employee
    POST    endpoint
    Log    response body: ${get-users}
    ${result} =    GET  ${get-users}
    Log    ${result}
