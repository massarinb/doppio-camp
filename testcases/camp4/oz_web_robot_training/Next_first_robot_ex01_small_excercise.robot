*** settings ***
Library 			SeleniumLibrary

*** Variables ***
${message}			My Message

*** Keywords ***
Say Hello
	Log To Console 			ThisIsSayHello

*** Test cases ***
TC-001 Verify that when input correct username and password then user can login
	Open Browser 	file:///C:/Users/Next%20Doppio/Desktop/ep01/ep01_small_excercise.html		browser=chrome
	Input Text 		           id=username-box			                    Next Doppio
	Input Text 		           xpath=//div[@v='password']/input             Ex01 small excercise
    Input Text                 xpath=//input[@doppio]                       Next is Awesome
    Select From List By Label  xpath=//select[@id="company"]                Doppio
    Click Element              id=op1
    Sleep                      1
    Click Button               id=use-me 