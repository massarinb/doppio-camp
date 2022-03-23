*** Settings ***
Library     SeleniumLibrary
Resource    ${CURDIR}/../pages/login.robot
Resource    ${CURDIR}/../pages/home.robot
Resource    ${CURDIR}/../pages/productDetail.robot
Resource    ${CURDIR}/../pages/head.robot    

*** Variable ***
${urlLogin}    http://125.26.15.143:13132/

*** Keywords ***
Open Website Doppio
    Open Browser  url=${urlLogin}  browser=chrome

Login With Username And Password
    [Arguments]     ${username}     ${password}
    login.Input Username      ${username}
    login.Input Password      ${password}
    login.Click Login

Verify Login Failed
    Location Should Be      ${urlLogin} 
    Alert Should Be Present     text=${loginFailedText}

Verify Login Pass
    Wait Until Page Contains Element    ${homePageContentXpath}
    ${currentUrl}=     Get Location
    Should be equal      ${urlhome}     ${currentUrl}
    
Verify That Search Result Contain Search Text
    [Arguments]     ${searchText}
    Wait Until Element Is Visible   ${itemListXpath}
    ${elements}=    Get WebElements    ${itemListXpath} 
    FOR     ${element}   IN     @{elements}
        ${elementText}  Get Text   ${element}
        ${lower_case_text}=    Convert To Lower Case     ${elementText}
        Should Contain      ${lower_case_text}    ${searchText}
    END

Verify No Result Found
    Wait Until Page Does Not Contain Element        ${itemCardXpath}
    Wait Until Element Is Visible       ${notFoundXpath}
    ${text}=    Get Text    ${notFoundXpath} 
    Should be equal     ${text}     No results found.

Verify Item Quantity
    [Arguments]     ${quantity}     ${prevQuantity}
    Wait Until Element Does Not Contain  ${itemQuantityXpath}       ${prevQuantity} 
    ${itemQuantity}=    Get Text    ${itemQuantityXpath}   
    Should Be Equal     ${itemQuantity}     ${quantity}

Clear Cart And Verify Empty Cart
    head.Hover Clear Cart Button
    head.Click Clear Cart Button
    Wait Until Element Contains     ${itemQuantityXpath}    0
    ${quantity}=    Get Text    ${itemQuantityXpath}
    Should Be Equal     ${quantity}     0

Search Keyword Via Search Bar   
    [Arguments]     ${searchText}
    Wait Until Element Is Visible       ${searchFieldXpath} 
    head.Input Text To Search Bar  ${searchText}
    head.Click Search

