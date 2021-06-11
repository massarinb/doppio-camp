*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
Open Test Application For Android
    Open Test Application
    Close App Popup When App Start
    Click Expansion Panels Menu
    Click Basic
    Click Toggle Down Icon
    Select Female
    Click Save

*** Keywords ***
Open Test Application
    Open Application        remote_url=http://localhost:4723/wd/hub     
    ...     deviceName=Test Device
    ...     platformVersion=11.0
    ...     platformName=Android
    ...     appPackage=com.material.components
    ...     appActivity=com.material.components.activity.MainMenu

Close App Popup When App Start
    Wait Until Page Contains Element        id=com.material.components:id/bt_close      30s
    Tap     id=com.material.components:id/bt_close

Click Expansion Panels Menu
    Wait Until Page Contains Element        android=UiSelector().className("android.widget.TextView").text("Expansion Panels")      30s
    Tap     android=UiSelector().className("android.widget.TextView").text("Expansion Panels")

Click Basic
    Wait Until Page Contains Element        android=UiSelector().className("android.widget.TextView").text("Basic")      30s
    Tap     android=UiSelector().className("android.widget.TextView").text("Basic")

Click Toggle Down Icon
    Wait Until Page Contains Element        id=com.material.components:id/bt_toggle_input       30s
    Tap     id=com.material.components:id/bt_toggle_input

Select Female
    Wait Until Page Contains Element        android=UiSelector().className("android.widget.RadioButton").text("Female")      30s
    Tap     android=UiSelector().className("android.widget.RadioButton").text("Female")

Click Save
    Wait Until Page Contains Element        id=com.material.components:id/bt_save_input       30s
    Tap     id=com.material.components:id/bt_save_input