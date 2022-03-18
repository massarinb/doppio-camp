*** Variable ***
${plusButtonXpath}      //div[@id='remove']/button
${addToCartButtonXpath}      //button[text()= 'Add To Cart']

*** Keywords ***
Click add to cart button
    Wait Until Element Is Visible    ${addToCartButtonXpath}
    Click Element   ${addToCartButtonXpath}

Verify add to cart button is displayed
    Wait Until Page Contains Element    ${addToCartButtonXpath}
    Wait Until Element Is Visible    ${addToCartButtonXpath}

Add Item Quantity By Click Plus Button
    [Arguments]     ${quantity}
    FOR    ${i}    IN RANGE    ${quantity}
           Click Element   ${plusButtonXpath} 
    END
