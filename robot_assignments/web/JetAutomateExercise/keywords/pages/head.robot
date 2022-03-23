*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${searchFieldXpath}     //input[@id='keyword']
${searchButtonXpath}       //button[@id='searchbtn'] 
${searchFieldXpath}     //input[@id='keyword']
${itemQuantityXpath}     //span[@id='lblCartCount']/b
${cartHoverXpath}       //div[@class='dropdown-trigger' and ..//button[@class='button is-danger']]
${clearCartButtonXpath}     //button[@class='button is-danger']

*** Keywords ***
Input Text To Search Bar
    [Arguments]     ${text}
    Input Text      ${searchFieldXpath}     ${text}

Click Search
    Click Element   ${searchButtonXpath}

Hover Clear Cart Button
    Mouse Over      ${cartHoverXpath}
    
Click Clear Cart Button
    Wait Until Element Is Visible       ${clearCartButtonXpath}
    Click Element   ${clearCartButtonXpath}