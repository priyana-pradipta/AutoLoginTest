*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections

*** variables ***
${Base_URL}       http://thetestingworldapi.com

*** Test Cases ***
Get-Request
    [Tags]    get
    Create Session    Get_Student_Details    ${Base_URL}
    ${response}=    get request    Get_Student_Details    api/studentsDetails
    log to console    ${response.status_code}
    log to console    ${response.content}

Post-Request
    [Tags]    post
    Create Session    AddData    ${Base_URL}
    &{body}=    Create Dictionary    first_name=Putu    middle_name=Priyana    last_name=Pradipta    date_of_birth=26/08/1999
    &{header}=    Create Dictionary    Content-Type=application/json
    ${response}=    Post Request    AddData    api/studentsDetails    data=${body}    headers=&{header}
    ${code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${code}    201
    Log To Console    ${response.content}

Put-Request
    [Tags]    put
    Create Session    AddData    ${Base_URL}
    &{body}=    Create Dictionary    first_name=Putu    middle_name=Priyana    last_name=Pradipta    date_of_birth=26/08/1999
    &{header}=    Create Dictionary    Content-Type=application/json
    ${response}=    Put Request    AddData    api/studentsDetails/1818    data=${body}    headers=&{header}
    log to console    ${response.status_code}
    log to console    ${response.content}
    ${response1}=    Get Request    AddData    api/studentsDetails/1818
    Log To Console    ${response1.content}
