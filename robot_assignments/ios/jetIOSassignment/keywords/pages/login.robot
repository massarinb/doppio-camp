*** Variables ***
${username_field_xpath}  //XCUIElementTypeOther[@name="lbUsername"]  
${password_field_path}      //XCUIElementTypeOther[@name="lbPassword"]
${login_button_xpath}  //XCUIElementTypeButton[@name="btnLogin"]

*** Keywords ***
Input Text To Username Field  
    [Arguments]     ${id}
    Wait Until Element Is Visible       ${username_field_xpath}      1min
    Input Text        ${username_field_xpath}        ${id}

Input Text To Password Field  
    [Arguments]     ${pass}
    Wait Until Element Is Visible       ${password_field_path}     1min
    Input Text        ${password_field_path}       ${pass}

Click Login Button
    Wait Until Element Is Visible       ${login_button_xpath}
    Click Element    ${login_button_xpath}
    
Click Password Field
    Wait Until Element Is Visible       ${password_field_path}      1min
    Click Element   ${password_field_path}
    