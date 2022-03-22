*** Settings ***
Resource    ${CURDIR}/../import.robot
Test Setup      Open Test Application

*** Test Cases ***
test01
    login_features.Open Login Page From Home Page
    login_features.Verify Login Page Title
    login_features.Verify Forgot Password Text
    login_features.Verify Login Button Text
    #Verify Username title label
    #Verify placeholder Text
    #Verify password title label

test02
    login_features.Open Login Page From Home Page
    login.Input Text To Username Field  a
    login.Click Password Field
    #verify in correct email message
    login.Input Text To Username Field       test@
    login.Click Password Field
    #verify in correct email message
    login.Input Text To Username Field       mail
    #verify in correct email message'
    login.Click Password Field

 test03
    login_features.Open Login Page From Home Page  
    login.Input Text To Username Field   jetcarino123890@gmail.com
    login.Input Text To Password Field   Leonado007
    login.Click Login Button
    menu.Click Menu
    menu_features.Verify Name On Greeting Menu  patomtong r
 
