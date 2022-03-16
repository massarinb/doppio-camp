*** Settings ***
Library     SeleniumLibrary
*** Variable ***
${searchFieldXpath}     //input[@id='keyword']
${searchButtonXpath}       //button[@id='searchbtn'] 
${searchFieldXpath}     //input[@id='keyword']
${itemQuantityXpath}     //span[@id='lblCartCount']/b
${cartHoverXpath}       //div[@id='head']/div[2]/div/div/div/div[@class='column'][1]/div/div[@class='dropdown-trigger']
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
    Click Element   ${clearCartButtonXpath}