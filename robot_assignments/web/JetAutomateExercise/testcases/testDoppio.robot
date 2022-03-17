*** Settings ***
Resource    ${CURDIR}/../import.robot
Test Setup      Open Website Doppio
Test Teardown   Close Browser

*** Variable ***
${urlLogin}    http://125.26.15.143:13132/ 
${username}     oz4899
${password}     1234
${username_wrong}   abcd
${searchText}   shirt
${searchText_wrong}   abcd

*** Test Cases ***
Testcase 01 - Verify that user cannot login with wrong username
    features.Login With Username And Password  ${username_wrong}    ${password}
    features.Verify Login failed

Testcase 02 - Verify that user can login to the system when username are correct
    features.Login With Username And Password   ${username}    ${password}
    features.Verify Login Pass

Testcase03 - Verify that search function are working correctly
    features.Login With Username And Password   ${username}    ${password}
    features.Search Keyword Via Search Bar      ${searchText_wrong}
    features.Verify No Result Found
    features.Search Keyword Via Search Bar      ${searchText}
    features.Verify That Search Result Contain Search Text  ${searchText}

Testcase04
    features.Login With Username And Password   ${username}    ${password}
    home.Click Product    ${firstItemXpath}
    productDetail.Click Add To Cart button
    features.Verify Item Quantity    1      0
    productDetail.Add item quantity by click plus button      ${4}
    productDetail.Click Add To Cart button
    features.Verify Item Quantity    6      1
    features.Clear Cart And Verify Empty Cart



