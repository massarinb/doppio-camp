*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${homePageContentXpath}     //div[@id='home']//div[@id='product-card']
${urlhome}      http://125.26.15.143:13132/home.html
${notFoundXpath}        //div[@id='notFound']
${itemCardXpath}        //div[@id='product-card']
${itemListXpath}        //div[@class='card-content p-4']/p[1]
${firstItemXpath}       //div[@id='product-card'][1]

*** Keywords ***
Click Product
    [Arguments]     ${locator}
    Wait Until Element Is Visible       ${locator}
    Click Element       ${locator}