#Restructure from Jet code by Reena
*** Variable ***
${item_card_xpath}        //div[@id='product-card']
${not_found_xpath}        //div[@id='notFound']
${item_list_xpath}        //div[contains(@class,'card-content')]/p[1]    #//div[@id='home']/div/div/div/div/a/div/div/p[1]
${searchFieldXpath}     //input[@id='keyword']
${searchButtonXpath}       //button[@id='searchbtn'] 
${searchFieldXpath}     //input[@id='keyword']
${itemQuantityXpath}     //span[@id='lblCartCount']/b
${cartHoverXpath}       //div[@id='head']/div[2]/div/div/div/div[@class='column'][1]/div/div[@class='dropdown-trigger']
${clearCartButtonXpath}     //button[@class='button is-danger']

*** Keywords ***
Search result does not display any product
    Wait Until Page Does Not Contain Element        ${item_card_xpath}

Verify search result display error no result found message
    Wait Until Element Is Visible       ${not_found_xpath}
    ${text}=    Get Text    ${not_found_xpath} 
    Should be equal     ${text}     No results found.

Search result display some products
    Wait Until Element Is Visible   ${item_list_xpath}

Verify search result contain search text
    [Arguments]     ${search_text}
    ${elements}=    Get WebElements    ${item_list_xpath} 
    FOR     ${element}   IN     @{elements}
        ${element_text}  Get Text   ${element}
        ${lower_case_text}=    Convert To Lower Case     ${element_text}
        Should Contain      ${lower_case_text}    ${search_text}
    END