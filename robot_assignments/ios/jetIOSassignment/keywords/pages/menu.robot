*** Variables ***
${menu_button_xpath}            //XCUIElementTypeButton[@name="ic menu"]
${user_greeting_xpath}          //XCUIElementTypeCell[@name="UserGreeting:0"]
${sign_out_button_xpath}        //XCUIElementTypeCell[@name="MenuSignout:31"]

*** Keywords ***
Click Menu
    Wait Until Element Is Visible    ${menu_button_xpath}
    Click Element       ${menu_button_xpath}

Click User Greeting
    Wait Until Element Is Visible       ${user_greeting_xpath}
    Click Element       ${user_greeting_xpath}

Click Sign Out
    Wait Until Element Is Visible       ${sign_out_button_xpath}
    Click Element       ${sign_out_button_xpath}

Swipe Menu Down     
    Swipe     start_x=110    start_y=780    offset_x=110    offset_y=240      duration=1000
    Swipe     start_x=110    start_y=780    offset_x=110    offset_y=200      duration=1000