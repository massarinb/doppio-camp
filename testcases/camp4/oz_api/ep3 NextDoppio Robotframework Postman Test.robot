
*** Settings ***
Library         RequestsLibrary


*** Test Cases ***
TC-001 Verify when input wrong username or password, API should return error
     #call API with wrong username / password
     #verify status code is 401 -- done
     # #verify status message is error -- done
     # #verify error message is invalid username or password -- done
    Create Session      loginSession             http://localhost:8082       
    ${request_body}=    Create Dictionary   username=doppio11  password=Wrongpass
    ${resp}=    POST On Session     loginSession    /login      json=${request_body}    expected_status=401
    Should Be Equal      ${resp.json()['status']}  error
    Should Be Equal      ${resp.json()['message']}  invalid username or password


TC-002 Verify That Can Get Asset List From Get API correctly
    #call API to login and get token -- done
    #call Get API to get asset (with token) and verify status code is 200   
    #check response contains at least 1 assets
    Create Session      assetSession             http://localhost:8082       
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    ${headers}=     Create Dictionary    token=${token} 
    ${get_resp}=    GET On Session      assetSession    /assets     headers=${headers} 
    # #Log To Console      ${get_resp.text} 
    ${count}=       Get Length  ${get_resp.json()} 
    ${morethanone}=     Evaluate    ${count}>1
    Should Be True      ${morethanone}


TC-003 Verify that get asset API always require valid token
    #call asset API with invalid token or with no token 
    #check response code = 401 -- done
    #check error message -- done  
    Create Session      assetSession             http://localhost:8082       
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    ${headers}=     Create Dictionary    token=${token} 
    ${get_resp}=    GET On Session      assetSession    /assets      expected_status=401    #headers=${headers}
    Should Be Equal      ${get_resp.json()['status']}   error
    Should Be Equal      ${get_resp.json()['message']}  you do not have access to this resource
  


TC-004 Verify that create asset API can work correctly 
#     #call create asset API (POST /assets) with valid token
#     #check response code = 200 
#     # check status message = success
#     # check that created asset can be returned from GET /assets 
    Create Session      assetSession             http://localhost:8082       
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    ${headers}=     Create Dictionary    token=${token} 
    ${asset_body}=      Create Dictionary   assetId=a888        assetName=Javis Stark       assetType=1         inUse=True 
    ${create_resp}=     POST On Session     assetSession    /assets      json=${asset_body}     headers=${headers}   expected_status=200
    Log To Console      ${create_resp.text} 
    Should Be Equal     ${create_resp.json()['status']}    success
    ${get_resp}=    GET On Session      assetSession    /assets     headers=${headers} 
    Log To Console      ${get_resp.text} 

    


TC-005 Verify that cannot create asset with duplicated ID 
# #     #call create asset with valid token but use duplicate asset ID 
# #     # check status message 
# #     # check error message 
# #     # check that no duplicated asset returned from GET /assets
    Create Session      assetSession             http://localhost:8082       
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    ${headers}=     Create Dictionary    token=${token} 
    ${asset_body}=      Create Dictionary   assetId=a888        assetName=Javis Stark       assetType=1         inUse=True  
    ${existing}=  Set Variable    a888
    ${create_resp}=     POST On Session     assetSession    /assets      json=${asset_body}     headers=${headers}   expected_status=200
    Log To Console      ${create_resp.text} 
    Should Be Equal     ${create_resp.json()['status']}    failed
    Should Be Equal     ${create_resp.json()['message']}   id : ${existing} is already exists , please try with another id 
    ${get_resp}=    GET On Session      assetSession    /assets     headers=${headers} 
     Log To Console      ${get_resp.text}


TC-006 Verify that modify asset API can work correctly 
#     #call modify asset with valid token and try to change name of some asset 
#     #check status message = success 
#     #call get api to check that asset Name has been changed
    Create Session      assetSession             http://localhost:8082       
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    ${headers}=     Create Dictionary    token=${token} 
    ${asset_body}=      Create Dictionary   assetId=a888        assetName=IronMan       assetType=2         inUse=True 
    ${mod_resp}=     PUT On Session     assetSession    /assets      json=${asset_body}     headers=${headers}   expected_status=200
    Log To Console      ${mod_resp.text} 
    Should Be Equal     ${mod_resp.json()['status']}    success
    ${get_resp}=    GET On Session      assetSession    /assets     headers=${headers} 
    Log To Console      ${get_resp.text} 


TC-007 Verify that delete asset API can work correctly
#     #call delete asset 
#     #call GET to check that asset has been deleted 
    Create Session      assetSession             http://localhost:8082       
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    ${headers}=     Create Dictionary    token=${token} 
    ${delete_id}=  Set Variable    a888
    ${del_resp}=    DELETE On Session     assetSession    /assets/${delete_id}    headers=${headers}   
    Log To Console      ${del_resp.text} 
    Should Be Equal     ${del_resp.json()['status']}    success
    ${get_resp}=    GET On Session      assetSession    /assets     headers=${headers} 
    Log To Console      ${get_resp.text} 


TC-008 Verify that cannot delete asset which ID does not exists 
#     #call delete asset with non-existing id 
#     #check error message 
    Create Session      assetSession             http://localhost:8082       
    ${request_body}=    Create Dictionary   username=doppio  password=weBuildBestQa
    ${resp}=    POST On Session     assetSession    /login      json=${request_body}    expected_status=200
    ${token}=   Set Variable    ${resp.json()['message']} 
    ${headers}=     Create Dictionary    token=${token} 
    ${delete_id}=  Set Variable    a12345
    ${del_resp}=    DELETE On Session     assetSession    /assets/${delete_id}    headers=${headers}   
    Log To Console      ${del_resp.text} 
    Should Be Equal     ${del_resp.json()['status']}    failed
    Should Be Equal     ${del_resp.json()['message']}    cannot find this id in database
    