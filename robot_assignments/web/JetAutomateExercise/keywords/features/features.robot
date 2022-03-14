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
    Input Username      ${username}
    Input Password      ${password}
    Click Element   ${loginButtonXpath}

Verify Login Failed
    Location Should Be      ${urlLogin} 
    Alert Should Be Present     text=${loginFailedText}

Verify Login Pass
    Wait Until Page Contains Element    ${homePageContentXpath}
    ${currentUrl}=     Get Location
    Should be equal      ${urlhome}     ${currentUrl}
    
Verify That Search Result Contain Search Text
    [Arguments]     ${searchText}
    ${elements}=    Get WebElements    ${itemListXpath} 
    FOR     ${element}   IN     @{elements}
        ${elementText}  Get Text   ${element}
        ${lower_case_text}=    Convert To Lower Case     ${elementText}
        Should Contain      ${lower_case_text}    ${searchText}
    END

Verify No Result Found
    ${text}=    Get Text    ${notFoundXpath} 
    Should be equal     ${text}     No results found.

Add Item Quantity By Click Plus Button
    [Arguments]     ${quantity}
    FOR    ${i}    IN RANGE    ${quantity}
           Click Element   ${plusButtonXpath} 
    END

Verify Item Quantity
    [Arguments]     ${quantity}
    ${itemQuantity}=    Get Text    ${itemQuantityXpath}   
    Should Be Equal     ${itemQuantity}     ${quantity}

Clear Cart And Verify Empty Cart
    Hover Clear Cart Button
    Wait Until Element Is Visible       ${clearCartButtonXpath}
    Click Clear Cart Button
    Wait Until Element Contains     ${itemQuantityXpath}    0
    ${quantity}=    Get Text    ${itemQuantityXpath}
    Should Be Equal     ${quantity}     0