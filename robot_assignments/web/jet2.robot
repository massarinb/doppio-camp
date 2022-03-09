*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${urlLogin}    http://125.26.15.143:13132/ 
${urlhome}      http://125.26.15.143:13132/home.html
${username1}    helloworld
${password1}    1234
${username2}    oz4899
${password2}    1234
${loginIDFieldXpath}    //input[@id='username']
${loginPasswordFieldXpath}      //input[@id='password']
${loginButtonXpath}     //button[@type='submit']
${homePageContentXpath}     //div[@class='container']/div[@class='box']
${searchFieldXpath}     //div[@class='column is-four-fifths']/input 
${searchButtonXpath}       //button[@id='searchbtn'] 
${itemListXpath}        //div[@class='card-content p-4']/p
${noResultFoundXpath}       //div[@class='box']/div/div
${firstItemXpath}       //div[@class='box']/div/div[1]
${addToCartButtonXpath}      //button[@class='button is-info is-size-5']
${itemQuantityXpath}     //span[@id='lblCartCount']/b
${plusButtonXpath}      //div[@id='remove']/button
${cartHoverXpath}       //div[@class='column']/div/div[@style='text-align: center;']/div/div[@class='dropdown-trigger']
${clearCartButtonXpath}     //button[@class='button is-danger']

*** Keywords ***
Open Website
    Open Browser  url=${urlLogin}  browser=chrome

Login Website   
    Input Text   ${loginIDFieldXpath}    ${username2}
    Input Text   ${loginPasswordFieldXpath}      ${password2}
    Click Element   ${loginButtonXpath}
    Wait Until Page Contains Element    ${homePageContentXpath}
    ${currentUrl}=     Get Location
    Should be equal      ${urlhome}     ${currentUrl}

*** Test cases ***
Testcase 01 - Verify that user cannot login with wrong username
    Open Website
    Input Text   ${loginIDFieldXpath}     ${username1}
    Input Text   ${loginPasswordFieldXpath}     ${password1}
    Click Element   ${loginButtonXpath}
    ${currentUrl}=     Get Location
    Should be equal      ${urlLogin}     ${currentUrl}
    sleep   1s
    Close Browser

Testcase 02 - Verify that user can login to the system when username are correct
    Open Website   
    Login Website
    sleep   1s
    Close Browser

Testcase 03 - Verify that search function are working correctly
    Open Website   
    Login Website

    Input Text      ${searchFieldXpath}     abcd
    Click Element   ${searchButtonXpath}  
    sleep   1s
    ${text}=    Get Text    ${noResultFoundXpath}
    Should be equal     ${text}     No results found.

    Input Text      ${searchFieldXpath}     shirt
    Click Element   ${searchButtonXpath}   
    sleep   1s
    ${elements}=    Get WebElements    ${itemListXpath} 
    ${elementText}  Get Text   ${elements}[0]
    ${lower_case_text}=    Convert To Lower Case     ${elementText}
    Should Contain      ${lower_case_text}    shirt
    sleep   1s
    Close Browser

Testcase 04 - Verify that add to cart function are working correctly
    Open Website   
    Login Website
    Click Element   ${firstItemXpath}
    Wait Until Page Contains Element    ${addToCartButtonXpath}
    Click Element   ${addToCartButtonXpath}
    sleep  1s
    ${itemQuantity}=    Get Text    ${itemQuantityXpath}   
    Should Be Equal     ${itemQuantity}     1
    Click Element   ${plusButtonXpath} 
    Click Element   ${plusButtonXpath}
    Click Element   ${plusButtonXpath}
    Click Element   ${plusButtonXpath}
    Click Element   ${addToCartButtonXpath}
    sleep  1s
    ${itemQuantity}=    Get Text    ${itemQuantityXpath}  
    Should Be Equal     ${itemQuantity}     6
    Mouse Over      ${cartHoverXpath}
    sleep   1s
    Click Element   ${clearCartButtonXpath}
    sleep   1s
    Close Browser
