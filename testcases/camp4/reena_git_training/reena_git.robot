*** Settings ***
Library    PuppeteerLibrary    

*** Test Cases ***  
Demo puppeteer solve flaky test
    Open Browser    http://127.0.0.1:7272/ajax-demo.html    browser=chrome
    Maximize Browser Window
    Input Text    id=idcard    123456789
    Run Async Keywords    
    ...     Click Element    id=verify    AND
    ...     Wait Until Element Is Visible    id=loading
    Wait Until Element Is Hidden    id=loading
    Click Element    id=submit
    Wait Until Page Contains    Login succeeded