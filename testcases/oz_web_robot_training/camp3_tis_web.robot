*** Settings ***

Library					SeleniumLibrary

*** Variables ***

${Aunyong}				Hello

*** Keywords ***

Say Hello
	Log to Console		ThisIsSayHello

*** Test Cases ***

TC-001: If input correct username and password, user can login
	Open Browser						file:///C:/Users/Tis%20Doppio/AppData/Local/Temp/Temp1_ep01_material.zip/ep01/ep01_small_excercise.html															browser=chrome
	Input Text							id=username-box																									ThisIsUsername
	Input Text							xpath=//div[@v='password']/input																				ThisIsPassword
	Input Text							xpath=//div/input[@doppio='nickname']																			ThisIsNickname
	Select From List By Value			name=com	doppio
	Select Checkbox						id=op1
	Click Button						id=use-me

	#locator - There are many things we can use as a locator
	#<input name="q"></input>
	#<input id="abc"></input>
	#<input xpath="xxx"></input> ***

	#locator
	#- id
	#- name
	#- xpath

#xpath - บอกตำแหน่งของ Input โดยการไล่ชั้นของ Element ลงไป

#/html/div/span/input - #ไล่ทีละชั้นลงไปยัง input
#/html//input - #จาก html ไปที่ input เลย
#//input - #ไปที่ input เลย

#<html>
#	<div>
#		<span>
#			<input/>
#		</span>
#	</div>
#</html>

#robot first_robot.robot