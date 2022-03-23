*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${plusButtonXpath}      //div[@id='remove']/button
${addToCartButtonXpath}      //div[@id='product-detail']/div[3]/div/div/div/div[2]/div[3]/button[1]

*** Keywords ***
Click Add To Cart button
    Wait Until Page Contains Element    ${addToCartButtonXpath}
    Click Element   ${addToCartButtonXpath}

Add Item Quantity By Click Plus Button
    [Arguments]     ${quantity}
    FOR    ${i}    IN RANGE    ${quantity}
           Click Element   ${plusButtonXpath} 
    END