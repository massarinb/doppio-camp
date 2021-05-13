*** Settings ***
Library		SeleniumLibrary		

*** variables ***
${message}		my message


*** keywords ***
Say Hello
	log to Console		ThisIsSayHello


*** Test cases ***
TC-001 verify that when input correct username and password then user can login
	Open Browser	file:///C:/Users/Doppio%20Spare/Desktop/ep01/xpath/ep01_small_excercise.html	browser=chrome	
	Input Text		id=username-box		pimwalun
	Input Text		xpath=//div[@v='password']/input	1234
	Input Text		xpath=//input[@doppio='nickname']		koi
	Select From List By Value		id=company		doppio
	Select Checkbox		id=op3
	Click Element		id=use-me