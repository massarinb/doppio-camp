*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${loginFailedText}      login failed
${loginIDFieldXpath}    //input[@id='username']
${loginPasswordFieldXpath}      //input[@id='password']
${loginButtonXpath}     //button[@id='loginbtn']

*** Keywords ***
Input Username
    [Arguments]     ${username2}
    Input Text   ${loginIDFieldXpath}    ${username2}
    
Input Password
    [Arguments]     ${password2}
    Input Text   ${loginPasswordFieldXpath}      ${password2}

Click Login
    Click Element   ${loginButtonXpath}



