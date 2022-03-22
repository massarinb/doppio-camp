*** Variables ***
${menu_button_xpath}   //XCUIElementTypeButton[@name="ic menu"]
${user_greeting_xpath}  //XCUIElementTypeCell[@name="UserGreeting:0"]

*** Keywords ***
Click Menu
    Wait Until Element Is Visible    ${menu_button_xpath}
    Click Element       ${menu_button_xpath}
Click User Greeting
    Wait Until Element Is Visible       ${user_greeting_xpath}
    Click Element       ${user_greeting_xpath}