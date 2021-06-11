*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
Open Test Application For android
    Open Test Application
    Close Popup When App Start
    Wait Until Page Contains Element    android=UiSelector().className("android.widget.TextView").text("Expansion Panels")     30s
    Tap     android=UiSelector().className("android.widget.TextView").text("Expansion Panels")
    Click Basic
    Wait Until Page Contains Element       id=com.material.components:id/bt_toggle_input        30s
    Tap     id=com.material.components:id/bt_toggle_input
    Select Female
    Click Save

*** Keywords ***
Open Test Application
    Open Application    remote_url=http://localhost:4723/wd/hub     
    ...     deviceName=TestDevice   
    ...     platformVersion=11.0    
    ...     platformName=Android
    ...     appPackage=com.material.components
    ...     appActivity=com.material.components.activity.MainMenu

Close Popup When App Start
    Wait Until Page Contains Element    id=com.material.components:id/bt_close      30s
    Tap     id=com.material.components:id/bt_close

Click Basic
    Wait Until Page Contains Element    android=UiSelector().className("android.widget.TextView").text("Basic")     30s
    Tap     android=UiSelector().className("android.widget.TextView").text("Basic")

Select Female
    Wait Until Page Contains Element    android=UiSelector().className("android.widget.RadioButton").text("Female")     30s
    Tap     android=UiSelector().className("android.widget.RadioButton").text("Female")

Click Save
    Tap     id=com.material.components:id/bt_save_input