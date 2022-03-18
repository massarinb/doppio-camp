#Restructure from Jet code by Reena
*** Keywords ***
Search product with keyword
    [Arguments]    ${keyword}
    head.Input Text To Search Bar  ${keyword}
    head.Click Search

Verify search result is not found
    search_result_page.Search result does not display any product
    search_result_page.Verify search result display error no result found message

Verify search result is displayed and match keyword
    [Arguments]    ${keyword}
    search_result_page.Search result display some products
    search_result_page.Verify search result contain search text    ${keyword}
