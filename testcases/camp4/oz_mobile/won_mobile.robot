*** Settings ***
Library     AppiumLibrary

*** Test Cases ***
Open Test Application For android
    Open Test Application
    Close Popup
    Click Search
    Input Search        Icon
    Click Bottom



*** Keywords ***
Open Test Application
    Open Application        http://localhost:4723/wd/hub
    ...     deviceName= Test Device
    ...     platformVersion=11.0
    ...     platformName=Android 
    ...     appPackage=com.material.components
    ...     appActivity=com.material.components.activity.MainMenu

Close Popup
    Wait Until Page Contains Element        id=com.material.components:id/bt_close      30s
    Tap    id=com.material.components:id/bt_close

Click Expansion Panels
    Tap     xpath=//android.widget.LinearLayout[android.widget.TextView[@text='Expansion Panels'] and android.widget.TextView]

Click Search
    Wait Until Page Contains Element        accessibility_id=Search      30s
    Tap     accessibility_id=Search

Input Search
    [Arguments]     ${kw}
    Wait Until Page Contains Element        id=com.material.components:id/search_src_text      30s
    Input Text     id=com.material.components:id/search_src_text        ${kw}

Click Bottom
    Wait Until Page Contains Element        xpath=//android.widget.LinearLayout[android.widget.TextView[@text='Bottom Navigation'] and android.widget.TextView[@text='Icon']]   30s
    Tap     xpath=//android.widget.LinearLayout[android.widget.TextView[@text='Bottom Navigation'] and android.widget.TextView[@text='Icon']]