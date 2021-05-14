*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
TC-001 Verify when input wrong username or password, API should return error
    #call API with wrong username / password
    Create Session      loginSession                http://localhost:8082
    ${request_body}=    Create Dictionary           username=doppio222      password=12345
    ${resp}=            POST On Session             loginSession            /login              json=${request_body}    expected_status=401
    Should Be Equal     ${resp.json()['status']}    error
    Should Be Equal     ${resp.json()['message']}   invalid username or password
TC-002 Verify That Can Get Asset List From Get API correctly
    #call API to login and get token
    Create Session      assetSession                http://localhost:8082
    ${request_body}=    Create Dictionary           username=doppio         password=weBuildBestQa
    ${resp}=            POST On Session             assetSession            /login              json=${request_body}    expected_status=200
    ${token}=           Set Variable                ${resp.json()['message']}
    ${headers}=         Create Dictionary           token=${token}
    #call Get API to get asset (with token) and verify status code is 200
    ${get_resp}=        GET On Session              assetSession            /assets             headers=${headers}
    #check response contains at least 1 assets
    ${count}=           Get Length  ${get_resp.json()}
    ${morethanone}=     Evaluate    ${count}>0
    Should Be True      ${morethanone}
TC-003 Verify that get asset API always require valid token
    #call asset API with invalid token or with no token
    Create Session      GetAssetSession             http://localhost:8082
    ${req_headers}=     Create Dictionary           token=abcd1234
    #check response code = 401 
    ${response}=        GET On Session              GetAssetSession         /assets             json=${req_headers}     expected_status=401
    #check error message 
    Should Be Equal     ${response.json()['status']}    error
    Should Be Equal     ${response.json()['message']}   you do not have access to this resource
TC-004 Verify that create asset API can work correctly 
    Create Session          CreateAssetSession      http://localhost:8082
    ${request_body}=        Create Dictionary       username=doppio             password=weBuildBestQa
    ${resp}=                POST On Session         CreateAssetSession          /login                  json=${request_body}    expected_status=200
    ${token}=               Set Variable            ${resp.json()['message']}
    #call create asset API (POST /assets) with valid token
    ${headers}=             Create Dictionary       token=${token}
    ${request_body_asset}=  Create Dictionary       assetId=a99c               assetName=Macpro m1     assetType=1             inUse=true
    #check response code = 200 
    ${response}=            POST On Session         CreateAssetSession      /assets     headers=${headers}  json=${request_body_asset}  expected_status=200 
    #check status message = success
    Should Be Equal         ${response.json()['status']}    success  
    #check that created asset can be returned from GET /assets
    ${get_response}=        GET On Session          CreateAssetSession      /assets                 headers=${headers}
    Should Contain          ${get_response.text}                        a99c
TC-005 Verify that cannot create asset with duplicated ID 
    Create Session          CreateDupSession      http://localhost:8082
    ${request_body}=        Create Dictionary       username=doppio             password=weBuildBestQa
    ${resp}=                POST On Session         CreateDupSession          /login                  json=${request_body}    expected_status=200
    ${token}=               Set Variable            ${resp.json()['message']}
    #call create asset with valid token but use duplicate asset ID
    ${headers}=             Create Dictionary       token=${token}
    ${request_body_asset}=  Create Dictionary       assetId=a99c               assetName=Macpro m1     assetType=1             inUse=true
    #check status message
    ${response}=            POST On Session         CreateDupSession      /assets     headers=${headers}  json=${request_body_asset}  expected_status=200
    #check error message
    Should Be Equal         ${response.json()['status']}    failed
    Should Be Equal         ${response.json()['message']}   id : a99c is already exists , please try with another id
TC-006 Verify that modify asset API can work correctly 
    Create Session          ModifyAssetSession      http://localhost:8082
    ${request_body}=        Create Dictionary       username=doppio             password=weBuildBestQa
    ${resp}=                POST On Session         ModifyAssetSession          /login                  json=${request_body}    expected_status=200
    ${token}=               Set Variable            ${resp.json()['message']}
    #call modify asset with valid token and try to change name of some asset
    ${headers}=             Create Dictionary       token=${token}
    ${request_body_asset}=  Create Dictionary       assetId=a004               assetName=Macpro m1     assetType=1             inUse=true
    #check status message = success
    Should Be Equal         ${resp.json()['status']}    success
    #call get api to check that asset Name has been changed
    ${get_response}=        GET On Session          CreateAssetSession      /assets                 headers=${headers}
    Should Contain          ${get_response.text}        Macpro m1
TC-007 Verify that delete asset API can work correctly
    Create Session          DeleteAssetSession      http://localhost:8082
    ${request_body}=        Create Dictionary       username=doppio             password=weBuildBestQa
    ${resp}=                POST On Session         DeleteAssetSession          /login                  json=${request_body}    expected_status=200
    ${token}=               Set Variable            ${resp.json()['message']}
    ${headers}=             Create Dictionary       token=${token}
    #call delete asset
    ${del_resp}=            DELETE On Session       DeleteAssetSession          /assets/a99c            headers=${headers}
    #call GET to check that asset has been deleted 
    ${get_resp}=            GET On Session          DeleteAssetSession          /assets                 headers=${headers}
    Should Not Contain      ${get_resp.text}        a99c
TC-008 Verify that cannot delete asset which ID does not exists 
    Create Session          DelExAssetSession       http://localhost:8082
    ${request_body}=        Create Dictionary       username=doppio             password=weBuildBestQa
    ${resp}=                POST On Session         DelExAssetSession           /login                  json=${request_body}    expected_status=200
    ${token}=               Set Variable            ${resp.json()['message']}
    ${headers}=             Create Dictionary       token=${token}
    #call delete asset with non-existing id
    ${del_resp}=            DELETE On Session       DelExAssetSession           /assets/a123            headers=${headers}
    #check error message 
    ${get_resp}=            GET On Session          DelExAssetSession           /assets                 headers=${headers}      expected_status=200
    Should Be Equal         ${del_resp.json()['status']}    failed
    Should Be Equal         ${del_resp.json()['message']}   cannot find this id in database