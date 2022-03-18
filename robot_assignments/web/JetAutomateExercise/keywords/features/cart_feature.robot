*** Keywords ***
Clear Cart And Verify Empty Cart
    head.Hover Clear Cart Button
    head.Click Clear Cart Button
    Wait Until Keyword Succeeds    5x    1s    head.Verify cart is cleared
