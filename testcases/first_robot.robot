*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/../keywords/simple.robot
Test Teardown    Close All Browsers

*** Variables ***
${message}    test_message
Conflict case
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

TC-099 Tis Merge Conflict Testcase 2 

TC-440 NNN Merge Conflict Testcase 2 
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG

TC-019 Tid First Robot Testcase
    Open Browser    http://www.google.com    browser=chrome	
	Input Text    name=q    Automate Test with Doppio
    simple.​Say Hello

TC-444 Baha Merge Conflict Testcase 2 
>>>>>>> main
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    
TC-012 koi Merge Conflict Testcase 1
    Open Browser    https://www.central.co.th/en    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    Panasonic
    Press Keys    None    RETURN
    Press Keys    None    RETURN

TC-019 Tid First Robot Testcase
    Open Browser    http://www.google.com    browser=chrome	
	Input Text    name=q    Automate Test with Doppio
    simple.​Say Hello
    
TC-058 Mint First Robot Testcase
    Open Browser    http://www.google.com    browser=chrome	
	Input Text    name=q    Automate Test with Doppio
    simple.​Say Hello

TC-099 Tis Merge Conflict Testcase 2 
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    
TC-999 Mint Merge Conflict Testcase 2 
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    Press Keys    None    RETURN

TC-999 Pei New Conflict Conflict Testcase 2 
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    Press Keys    None    RETURN


TC-1001 CHAMP New Conflict Conflict Testcase 2 
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    Press Keys    None    RETURN

TC-123 Aump Conflict 2
TC-1002 tontoei New Conflict Conflict Testcase 2 
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    Press Keys    None    RETURN

TC-10000 YEAN New Conflict Conflict Testcase 2 
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    Press Keys    None    RETURN

TC-1005 tontoei New Conflict Conflict Testcase 2 
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    Press Keys    None    RETURN
    close window
TC-456 Aump Conflict 4   
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    LG
    Press Keys    None    RETURN

TC-898 Next Merge Conflict Testcase 1.2
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    Mr. Next is Awesome
    Press Keys    None    RETURN


TC-1000 Next Merge Conflict Testcase 1.2 by Nampun
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    Mr. Next is Awesome
    Press Keys    None    RETURN

TC-1001 Next Merge Conflict Testcase 1.2 by Pang
    Open Browser    https://www.central.co.th/th    browser=chrome	
	Input Text    id=txt-searchProductOnSearchBar    Mr. Next is Awesome
    Press Keys    None    RETURN