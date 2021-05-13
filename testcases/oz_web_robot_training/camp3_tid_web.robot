*** settings ***
Library				SeleniumLibrary

*** Variables ***
${message}			MyMessage

*** Keywords ***
Say Hello
	Log to Console		ThisIsSayHello

*** Test cases ***
TC001 Verify that when input correct username and password then user can login
	Open Browser	file:///C:/Users/Tid%20Doppio/ep01_material/ep01/ep01_small_excercise.html		browser=chrome
	Input Text		id=username-box										Wisalya
	Input Text		xpath=//div[@v='password']/input					Password
	Input Text		xpath=//div[input[@doppio='nickname']]/input		Tid
	Select From List By Value		id=company		doppio		
	Select Checkbox		id=op1
	Click Button		id=use-me					