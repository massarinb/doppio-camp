*** Settings ***
Resource    ${CURDIR}/../import.robot


*** Variable ***
${urlLogin}    http://125.26.15.143:13132/ 
${username}     oz4899
${password}     1234
${username_wrong}   abcd
${searchText}   shirt
${searchText_wrong}   abcd

*** Test Cases ***
Testcase 01 - Verify that user cannot login with wrong username
    Open Website Doppio
    Login With Username And Password  ${username_wrong}    ${password}
    Verify Login failed
    Close Browser

Testcase 02 - Verify that user can login to the system when username are correct
    Open Website Doppio
    Login With Username And Password   ${username}    ${password}
    Verify Login Pass
    Close Browser

Testcase03 - Verify that search function are working correctly
    Open Website Doppio
    Login With Username And Password   ${username}    ${password}

    Wait Until Element Is Visible       ${searchFieldXpath} 
    Input Text To Search Bar      ${searchText_wrong}
    Click Search 
    Wait Until Page Does Not Contain Element        ${itemCardXpath}
    Wait Until Element Is Visible       ${notFoundXpath}
    Verify No Result Found

    Input Text To Search Bar     ${searchText}
    Click Search   
    Wait Until Element Is Visible   ${itemListXpath}
    Verify That Search Result Contain Search Text  ${searchText}
    Close Browser

Testcase04
    Open Website Doppio
    Login With Username And Password   ${username}    ${password}

    Wait Until Element Is Visible   ${firstItemXpath}
    Click Product    ${firstItemXpath}
    Wait Until Page Contains Element    ${addToCartButtonXpath}

    Click Add To Cart button
    Wait Until Element Does Not Contain  ${itemQuantityXpath}       0    
    Verify Item Quantity    1

    Add item quantity by click plus button      ${4}
    Click Add To Cart button
    Wait Until Element Does Not Contain  ${itemQuantityXpath}       1
    Verify Item Quantity    6

    Clear Cart And Verify Empty Cart
    Close Browser



