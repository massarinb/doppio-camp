*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../keywords/simple.robot
Test Teardown    Close All Browsers

*** variables ***
${message}    test_message
​
*** Test cases ***
TC-100 Mint First Robot Testcase
    Open Browser    http://www.google.com    browser=chrome	
	Input Text    name=q    Automate Test with Doppio
    simple.​Say Hello