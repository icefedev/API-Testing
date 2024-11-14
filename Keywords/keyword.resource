*** Settings ***
Library    RequestsLibrary
Resource    ../XPATH/xpath.resource
Resource    ../Variables/variable.resource

*** Keywords ***
Get Request From API
    [Documentation]    ทดสอบการเรียกใช้งาน GET Request
    ${response}=    Get   ${BASE_URL}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

POST Request From API
    [Documentation]    ทดสอบการเรียกใช้งาน POST Request
    ${data}=    Create Dictionary    title=foo    body=bar    userId=1
    ${response}=    POST    ${BASE_URL}    json=${data}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

PUT Request From API
    [Documentation]    ทดสอบการเรียกใช้งาน PUT Request เพื่ออัปเดตข้อมูลที่มีอยู่  
    ${data}=    Create Dictionary    title=updated title    body=updated body    userId=1
    ${response}=    PUT    ${BASE_URL}/${ID}   json=${data}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}

DELETE Request From API
    [Documentation]    ทดสอบการเรียกใช้งาน DELETE Request เพื่อลบข้อมูลที่มีอยู่   
    ${response}=    DELETE    ${BASE_URL}/${ID}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.text}

GET Request By Category
    [Documentation]    ทดสอบการเรียกใช้งาน GET Request
    ${response}=    Get   ${BASE_URL}/${ENDPOINT}    params=category=${CATEGORY} 
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.text}
                                
GET Request By Sort
    [Documentation]    ทดสอบการเรียกใช้งาน GET Request และจัดเรียงข้อมูลที่ดึงมา
    ${response}=    GET    ${BASE_URL}        params=sort_by=${SORT_BY}&order=${ORDER}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.json()}