*** Variables ***
${login_page_title_label_xpath}     //XCUIElementTypeStaticText[@name="ยินดีต้อนรับสู่ออฟฟิศเมท"]
${forget_password_xpath}        //XCUIElementTypeStaticText[@name="ลืมรหัสผ่าน"]   
${login_button_label_xpath}     //XCUIElementTypeButton[@name="btnLogin"]/XCUIElementTypeStaticText[@name="เข้าสู่ระบบ"]

*** Keywords ***
Open Login Page From Home Page
    menu.Click Menu
    menu.Click User Greeting
Verify Login Page Title
    Wait Until Element Is Visible   ${login_page_title_label_xpath}     1min
    ${welcome_text}     Get Text    ${login_page_title_label_xpath} 
    Should Be Equal     ${welcome_text}     ยินดีต้อนรับสู่ออฟฟิศเมท
Verify Forgot Password Text
    Wait Until Element Is Visible   ${forget_password_xpath}     1min
    ${forget_password_text}     Get Text    ${forget_password_xpath} 
    Should Be Equal     ${forget_password_text}        ลืมรหัสผ่าน
Verify Login Button Text
    Wait Until Element Is Visible   ${login_button_label_xpath}     1min
    ${login_text}     Get Text    ${login_button_label_xpath} 
    Should Be Equal     ${login_text}         เข้าสู่ระบบ