#Restructure from Jet code by Reena
*** Keywords ***
Login With Username And Password
    [Arguments]     ${username}     ${password}
    login_page.Input Username      ${username}
    login_page.Input Password      ${password}
    login_page.Click Login
    home_page.Verify homepage is displayed

Verify Login Failed
    Location Should Be      ${urlLogin}
    login_page.Verify alert message login failed

Verify Login Pass
    [Arguments]    ${account_firstname}
    home_page.Verify homepage is displayed
    home_page.Verify url is homepage url
    home_page.Verify displayed account should be   ${account_firstname}