*** Settings ***
Library     SeleniumLibrary
*** Variable ***
${homePageContentXpath}     //div[@id='home']/div/div/div/div[@id='product-card']
${urlhome}      http://125.26.15.143:13132/home.html
${notFoundXpath}        //div[@id='notFound']
${itemCardXpath}        //div[@id='product-card']
${itemListXpath}        //div[@id='home']/div/div/div/div/a/div/div/p[1]
${firstItemXpath}       //div[@id='product-card'][1]
*** Keywords ***
Click Product
    [Arguments]     ${locator}
    Click Element       ${locator}