*** Variable ***
${searchFieldXpath}     //input[@id='keyword']
${searchButtonXpath}       //button[@id='searchbtn'] 
${searchFieldXpath}     //input[@id='keyword']
${item_quantity_xpath}     //span[@id='lblCartCount']/b
${cartHoverXpath}       //div[@id='head']/div[2]/div/div/div/div[@class='column'][1]/div/div[@class='dropdown-trigger']
${clearCartButtonXpath}     //button[@class='button is-danger']

*** Keywords ***
Input Text To Search Bar
    [Arguments]     ${text}
    Wait Until Element Is Visible       ${searchFieldXpath}
    Input Text      ${searchFieldXpath}     ${text}

Click Search
    Click Element   ${searchButtonXpath}

Hover Clear Cart Button
    Mouse Over      ${cartHoverXpath}
    Wait Until Element Is Visible       ${clearCartButtonXpath}

Click Clear Cart Button
    Click Element   ${clearCartButtonXpath}

Verify cart is cleared
    ${quantity}=    Get Text    ${itemQuantityXpath}
    Should Be Equal     ${quantity}     0

Verify item quantity in cart should be
    [Arguments]     ${quantity}
    Wait Until Element Is Visible    ${item_quantity_xpath}
    ${itemQuantity}=    Get Text    ${item_quantity_xpath}   
    Should Be Equal     ${itemQuantity}     ${quantity}