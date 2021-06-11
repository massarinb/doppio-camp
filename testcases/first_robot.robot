*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../keywords/simple.robot
Test Teardown    Close All Browsers

*** Variables ***
${message}    test_message
​
*** Test cases ***
TC-001 Massarin Baha First Robot Testcase
    Open Browser    http://www.google.com    browser=chrome	
	Input Text    name=q    Automate Test with Doppio
    simple.​Say Hello

TC-002 Massarin Baha Central Testcase
    Open Browser    https://www.central.co.th/en    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    Panasonic
    Press Keys    None    RETURN

TC-004 Baha Central Testcase
    Open Browser    https://www.central.co.th/en    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    Panasonic
    Press Keys    None    RETURN