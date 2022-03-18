#Restructure from Jet code by Reena
*** Keywords ***
Click product on homepage
    [Arguments]    ${locator}
    home_page.Click Product  ${locator}
    product_detail_page.Verify add to cart button is displayed

Add product to cart with default quantity
    product_detail_page.Click Add To Cart button

Add product to cart by click plus button with quantity
    [Arguments]   ${qty}
    product_detail_page.Add Item Quantity By Click Plus Button    ${qty}
    product_detail_page.Click Add To Cart button

Verify item quantity in cart should be
    [Arguments]   ${qty}=1
    Wait Until Keyword Succeeds    5x    1s    head.Verify item quantity in cart should be    ${qty}
