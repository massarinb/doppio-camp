*** Variable ***
${homePageContentXpath}     //div[@id='home']/div/div/div/div[@id='product-card']
${urlhome}      http://125.26.15.143:13132/home.html
${notFoundXpath}        //div[@id='notFound']
${itemCardXpath}        //div[@id='product-card']
${itemListXpath}        //div[@id='home']/div/div/div/div/a/div/div/p[1]
${firstItemXpath}       //div[@id='product-card'][1]
${firstnameXpath}       //a[@href='profile.html']/span[@class='icon-text']

*** Keywords ***
Click Product
    [Arguments]     ${locator}
    Wait Until Element Is Visible   ${locator}
    Click Element       ${locator}

Verify homepage is displayed
    Wait Until Page Contains Element    ${homePageContentXpath}

Verify url is homepage url
    ${currentUrl}=     Get Location
    Should be equal      ${urlhome}     ${currentUrl}

Verify displayed account should be 
    [Arguments]    ${account_firstname}
    Wait Until Element Is Visible     ${firstnameXpath} 
    ${displayed_name}    Get Text    ${firstnameXpath} 
    Should be equal    ${account_firstname}    ${displayed_name}

Input search text on search bar
    Wait Until Element Is Visible       ${searchFieldXpath} 
    Input Text To Search Bar      ${searchText_wrong}