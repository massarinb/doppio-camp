 
*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
TC-001 Verify when input wrong username or password, API should return error
    #call API with wrong username / password
    Create Session      loginSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio222  password=12345
    ${resp}=    POST On Session     loginSession    /login      json=${request_body}    expected_status=401
    Should Be Equal     ${resp.json()['status']}    error
    Should Be Equal     ${resp.json()['message']}    invalid username or password

TC-002 Verify That Can Get Asset List From Get API correctly
    #call API to login and get token 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    #call Get API to get asset (with token) and verify status code is 200
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}
    #check response contains at least 1 assets
    ${count}=       Get Length  ${get_resp.json()}
    ${morethanone}=     Evaluate    ${count}>0
    Should Be True      ${morethanone}

TC-003 Verify that get asset API always require valid token
    #call asset API with invalid token or with no token 
    Create Session      assetSession             http://localhost:8082
    ${headers}=     Create Dictionary       token=12345
    # check response code = 401 
    ${resp}=    GET On Session     assetSession    /assets      headers=${headers}    expected_status=401
    # check error message 
    Should Be Equal     ${resp.json()['status']}    error
    Should Be Equal     ${resp.json()['message']}    you do not have access to this resource

TC-004 Verify that create asset API can work correctly 
    #call create asset API (POST /assets) with valid token and verify response code = 200
     Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    ${create_body}=    Create Dictionary    assetId=a006    assetName=HP pavillion      assetType=1     inUse=true
    ${create_resp}=     POST On Session     assetSession    /assets     headers=${headers}     json=${create_body}     expected_status=200
    # check status message = success
    Should Be Equal     ${create_resp.json()['status']}    success
    # check that created asset can be returned from GET /assets
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}      expected_status=200
    Should Contain  ${get_resp.text}   a006

TC-005 Verify that cannot create asset with duplicated ID 
    #call create asset with valid token but use duplicate asset ID 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    ${create_body}=    Create Dictionary    assetId=a006    assetName=HP pavillion      assetType=1     inUse=true
    ${create_resp}=     POST On Session     assetSession    /assets     headers=${headers}     json=${create_body}
    # check status message and error message 
    Should Be Equal     ${create_resp.json()['status']}    failed
    Should Be Equal     ${create_resp.json()['message']}    id : a006 is already exists , please try with another id
    # check that no duplicated asset returned from GET /assets
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}      expected_status=200
    Should Contain X Times  ${get_resp.text}   a006     1

TC-006 Verify that modify asset API can work correctly 
    #call modify asset with valid token and try to change name of some asset 
    Create Session      modifySession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     modifySession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    ${modify_body}=    Create Dictionary    assetId=a001    assetName=iPhone12      assetType=2     inUse=true
    ${modify_resp}=     PUT On Session     modifySession    /assets     headers=${headers}     json=${modify_body}
    #check status message = success 
    Should Be Equal     ${modify_resp.json()['status']}    success
    Should Be Equal     ${modify_resp.json()['message']}    remark: asset id will not be changed in any cases
    #call get api to check that asset Name has been changed 
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}      expected_status=200
    Should Contain  ${get_resp.text}   a001     iPhone12

TC-007 Verify that delete asset API can work correctly
    #call delete asset 
    Create Session      deleteSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     deleteSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    ${del_resp}=     DELETE On Session     deleteSession    /assets/a006     headers=${headers}     
    Should Be Equal     ${del_resp.json()['status']}    success
    #call GET to check that asset has been deleted 
    ${get_resp}=    GET On Session      deleteSession    /assets         headers=${headers}      expected_status=200
    Should Not Contain  ${get_resp.text}   a006

TC-008 Verify that cannot delete asset which ID does not exists 
    #call delete asset with non-existing id 
    Create Session      deleteSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     deleteSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    ${del_resp}=     DELETE On Session     deleteSession    /assets/a100     headers=${headers}     
    #check error message 
    Should Be Equal     ${del_resp.json()['status']}    failed
    Should Be Equal     ${del_resp.json()['message']}    cannot find this id in database