*** Variables ***
${menu_name_display_xpath}      //XCUIElementTypeStaticText[@name="สวัสดี, patomtong r"]

*** Keywords ***
Verify Name On Greeting Menu
    [Arguments]     ${name}
    Wait Until Element Is Visible    ${menu_name_display_xpath}
    ${greeting_text}  Get Text  ${menu_name_display_xpath}
    Should Contain  ${greeting_text}      ${name}