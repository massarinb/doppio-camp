*** Settings ***
Library     RequestsLibrary


*** Test Cases ***
TC-001 Verify when input wrong username or password , API should return error
    ###call API with wrong username / password
    Create Session      loginSession            http://localhost:8082
    ${request_body}=    Create Dictionary       username=doppio222  password=12345  
    ${resp}=    POST On Session     loginSession        /login      json=${request_body}    expected_status=401
    Should be equal     ${resp.json()['status']}        error
    Should be equal     ${resp.json()['message']}       invalid username or password

TC-002 Verify that can get asset list from GET API correctly
    Create Session      loginSession            http://localhost:8082
    ${request_body}=    Create Dictionary       username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     loginSession        /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    Log To Console  ${token}

TC-002 Verify that can get asset list from GET API correctly
    Create Session      assetSession            http://localhost:8082
    ${request_body}=    Create Dictionary       username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession        /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    ${get_resp}=        GET On Session      assetSession        /assets     headers=${headers}
    ${count}=       Get Length  ${get_resp.json()}
    ${morethanone}=     Evaluate    ${count}>0
    Should Be True      ${morethanone}
    Log To Console      ${morethanone}

TC-003 Verify that can get asset list from GET API correctly
    Create Session      assetSession            http://localhost:8082
    ${request_body}=    Create Dictionary       username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession        /login      json=${request_body}    expected_status=200
    ${headers}=     Create Dictionary       token=invalid_token
    ${get_resp}=        GET On Session      assetSession        /assets     headers=${headers}      expected_status=401
    Log To Console  ${get_resp}
    Should be equal     ${get_resp.json()['message']}        you do not have access to this resource

TC-004 Verify that can get asset list from GET API correctly
    Create Session      assetSession            http://localhost:8082
    ${request_body}=    Create Dictionary       username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession        /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']}
    ${headers}=     Create Dictionary       token=${token}
    ${new_body}=     Create Dictionary       assetId=a007       assetName=Macbook ari m1    assetType=1     inUse=true
    ${new_resp}=    POST On Session     assetSession    /assets    headers=${headers}    json=${new_body}    expected_status=200
    Should Be Equal     ${new_resp.json()['status']}        success   
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}
    Log To Console  ${new_resp}
    Should Contain          ${get_resp.text}        a007

TC-005 Verify that cannot create asset with duplicated ID 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}  expected_status=200  
    ${token}=   Set Variable    ${resp.json()["message"]}
    ${headers}=     Create Dictionary       token=${token}
    ${new_body}=    Create Dictionary   assetId=a007       assetName=Macbook ari m1    assetType=1     inUse=true     
    ${new_resp}=    POST On Session     assetSession    /assets    headers=${headers}    json=${new_body}    expected_status=200
    Should Be Equal     ${new_resp.json()['status']}        failed   
    Should Be Equal     ${new_resp.json()['message']}        id : a007 is already exists , please try with another id
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}
    ${count}=       Get Count    ${get_resp.text}     a007    
    ${morethanone}=     Evaluate    ${count}>0
    Should Be True        ${morethanone}

TC-006 Verify that modify asset API can work correctly 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}  expected_status=200  
    ${token}=   Set Variable    ${resp.json()["message"]}
    ${headers}=     Create Dictionary       token=${token}
    ${put_body}=    Create Dictionary       assetId=1234       assetName=Apple Iphone 12    assetType=1     inUse=true
    ${put_resp}=    PUT On Session     assetSession    /assets    headers=${headers}    json=${put_body}    expected_status=200
    Should Be Equal     ${put_resp.json()['status']}    success
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}
    Should Contain Any         ${get_resp.text}     Apple Iphone xr            
    
TC-007 Verify that delete asset API can work correctly
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}  expected_status=200  
    ${token}=   Set Variable    ${resp.json()["message"]}
    ${headers}=     Create Dictionary       token=${token}
    ${del_resp}=    DELETE On Session      assetSession    /assets/a007         headers=${headers}  expected_status=200
    ${get_resp}=    GET On Session      assetSession    /assets         headers=${headers}
    Should Not Contain Any         ${get_resp.text}      a007
     
TC-008 Verify that cannot delete asset which ID does not exists 
    Create Session      assetSession             http://localhost:8082
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}  expected_status=200  
    ${token}=   Set Variable    ${resp.json()["message"]}
    ${headers}=     Create Dictionary       token=${token}
    ${del_resp}=    DELETE On Session      assetSession    /assets/AAA123         headers=${headers}  expected_status=200
    Should Be Equal         ${del_resp.json()['message']}     cannot find this id in database