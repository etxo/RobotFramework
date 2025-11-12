*** Settings ***
Library     REST

*** Variables ***
${password}
${local-login}    http://localhost:8082/api/auth/login
${local-admins-list}    http://localhost:8082/api/admin/users
${login} =  {"email": "anyksciai@citytax.xyz", "password": "${password}"}

*** Tasks ***
Retrieve Last Registered Employee
    POST    ${local-login}
    Integer    response status  200
    Output  response body   admin_user.json
