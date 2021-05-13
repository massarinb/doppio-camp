
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
    ${request_headers}=    Create Dictionary   token=12345invalid
    # check response code = 401 
    ${resp}=    GET On Session     assetSession    /assets      json=${request_headers}    expected_status=401
     # check error message
    Should Be Equal     ${resp.json()['status']}       error
    Should Be Equal     ${resp.json()['message']}       you do not have access to this resource

TC-004 Verify that create asset API can work correctly 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login     json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    #call create asset API (POST /assets) with valid token
    ${headers}=     Create Dictionary       token=${token}
    ${create_body}=    Create Dictionary   assetId=a007      assetName=Macpro air m1  assetType=1      inUse=true
    ${resp_create}=    POST On Session     assetSession    /assets  headers=${headers}   json=${create_body}    expected_status=200
    # check status message = success
    Should Be Equal        ${resp_create.json()['status']}        success
    # check that created asset can be returned from GET /assets
    ${headers}=     Create Dictionary       token=${token}
    ${assets_body}      GET On Session     assetSession    /assets     headers=${headers}
    Should Contain     ${assets_body.text}      a007

TC-005 Verify that cannot create asset with duplicated ID 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login     json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    #call create asset with valid token but use duplicate asset ID 
    ${headers}=     Create Dictionary       token=${token}
    ${create_body}=    Create Dictionary   assetId=a007      assetName=Macpro air m2  assetType=1      inUse=true
    ${resp_create}=    POST On Session     assetSession    /assets  headers=${headers}   json=${create_body}    expected_status=200
    # check status message
    Should Be Equal        ${resp_create.json()['status']}        failed
    # check error message 
    Should Be Equal        ${resp_create.json()['message']}        id : a007 is already exists , please try with another id
    # check that no duplicated asset returned from GET /assets
    ${headers}=     Create Dictionary       token=${token}
    ${assets_body}      GET On Session     assetSession    /assets     headers=${headers}
    Should Contain X Times  ${assets_body.text}     a007       1



TC-006 Verify that modify asset API can work correctly
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login     json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    #call modify asset with valid token and try to change name of some asset
    ${headers}=     Create Dictionary       token=${token}
    ${modify_body}=     Create Dictionary   assetId=a002      assetName=Lenovo B113  assetType=2      inUse=true
    ${resp_modify}=        PUT On Session     assetSession    /assets  headers=${headers}   json=${modify_body}    expected_status=200  
    #check status message = success
    Should Be Equal        ${resp_modify.json()['status']}      success
    #call get api to check that asset Name has been changed 
    ${headers}=     Create Dictionary       token=${token}
    ${assets_body}      GET On Session     assetSession    /assets     headers=${headers}
    Should Contain    ${assets_body.text}     a002      Lenovo B113




TC-007 Verify that delete asset API can work correctly
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login     json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    #call delete asset 
    ${headers}=     Create Dictionary       token=${token}
    ${delete_body}      Create Dictionary       assetId=a007
    ${resp_delete}      DELETE On Session     assetSession    /assets/a007     headers=${headers}    json=${delete_body}    expected_status=200
    #call GET to check that asset has been deleted
    ${headers}=     Create Dictionary       token=${token}
    ${assets_body}      GET On Session     assetSession    /assets     headers=${headers}
    Should Not Contain      ${assets_body.text}     a007


TC-008 Verify that cannot delete asset which ID does not exists
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login     json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    #call delete asset with non-existing id 
    ${headers}=     Create Dictionary       token=${token}
    ${delete_body}      Create Dictionary       assetId=a008
    ${resp_delete}      DELETE On Session     assetSession    /assets/a008     headers=${headers}    json=${delete_body}    expected_status=401
    #check error message 
    Should Be Equal     ${resp_delete.json()['status']}       failed
    Should Be Equal     ${resp_delete.json()['message']}       cannot find this id in database




