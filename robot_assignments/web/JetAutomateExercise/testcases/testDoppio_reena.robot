*** Settings ***
Resource    ${CURDIR}/../import.robot
Test Setup    common.Open Website Doppio
#Test Teardown    Close Browser

*** Variable ***
${urlLogin}    http://125.26.15.143:13132/ 
${username}     oz4899
${password}     1234
${firstname}    K'Preeda
${username_wrong}   abcd
${searchText}   shirt
${searchText_wrong}   abcd

*** Test Cases ***
Testcase 01 - Verify that user cannot login with wrong username
    [Tags]    01
    login_feature.Login With Username And Password  ${username_wrong}    ${password}
    login_feature.Verify Login failed

Testcase 02 - Verify that user can login to the system when username are correct
    [Tags]    02
    login_feature.Login With Username And Password   ${username}    ${password}
    login_feature.Verify Login Pass    ${firstname}

Testcase03 - Verify that search function are working correctly
    [Tags]    03
    login_feature.Login With Username And Password   ${username}    ${password}
    search_feature.Search product with keyword    ${searchText_wrong}
    search_feature.Verify search result is not found
    search_feature.Search product with keyword    ${searchText}
    search_feature.Verify search result is displayed and match keyword    ${searchText}

Testcase04
    [Tags]    04
    login_feature.Login With Username And Password   ${username}    ${password}
    Run Keyword And Ignore Error    Run keywcart_feature.Clear Cart And Verify Empty Cart
    product_feature.Click product on homepage  ${firstItemXpath}
    product_feature.Add product to cart with default quantity
    product_feature.Verify item quantity in cart should be    1
    product_feature.Add product to cart by click plus button with quantity    4
    product_feature.Verify item quantity in cart should be    6
    [Teardown]    cart_feature.Clear Cart And Verify Empty Cart
