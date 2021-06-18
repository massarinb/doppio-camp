*** Settings ***
Library     AppiumLibrary



*** Test Cases ***
Open Test Application For android
    Open Test Application
    Close Popup When App Start
    Click Expansion panels
    Click Basic , Input , Male , and Save

    #Click Class "Cards"
    # Click Search Icon On Topbar
    # Input Search Keyword Into Search Box    Icon
    # Click Bottom Navigation Icon Menu


*** Keywords ***
Open Test Application
    Open Application    remote_url=http://localhost:4723/wd/hub     
    ...     deviceName=TestDevice   
    ...     platformVersion=11.0    
    ...     platformName=Android
    ...     appPackage=com.material.components
    ...     appActivity=com.material.components.activity.MainMenu


Close Popup When App Start
    Wait Until Page Contains Element        id=com.material.components:id/bt_close      30s
    Tap     id=com.material.components:id/bt_close

Click Search Icon On Topbar
    #TODO to click search
    Wait Until Page Contains Element    accessibility_id=Search
    Tap     accessibility_id=Search

Input Search Keyword Into Search Box
    [Arguments]     ${kw} 
    Wait Until Page Contains Element        id=com.material.components:id/search_src_text   30s
    Input Text      id=com.material.components:id/search_src_text       ${kw} 

Click Bottom Navigation Icon Menu
    Wait Until Page Contains Element    xpath=//android.widget.LinearLayout[android.widget.TextView[@text='Bottom Navigation'] and android.widget.TextView[@text='Icon']]   30s
    Tap     xpath=//android.widget.LinearLayout[android.widget.TextView[@text='Bottom Navigation'] and android.widget.TextView[@text='Icon']]


Click Class "Cards"
    Wait Until Page Contains Element    android=UiSelector().className("android.widget.TextView").text("Cards")     30s
    Tap     android=UiSelector().className("android.widget.TextView").text("Cards")

Click Expansion panels 
    Wait Until Page Contains Element    android=UiSelector().className("android.widget.TextView").text("Expansion Panels")     30s
    Tap     android=UiSelector().className("android.widget.TextView").text("Expansion Panels") 

Click Basic , Input , Male , and Save
    Wait Until Page Contains Element    android=UiSelector().className("android.widget.TextView").text("Basic")     30s
    Tap     android=UiSelector().className("android.widget.TextView").text("Basic") 
    Wait Until Page Contains Element    id=com.material.components:id/bt_toggle_input 
    Tap     id=com.material.components:id/bt_toggle_input
    Wait Until Page Contains Element    android=UiSelector().className("android.widget.RadioButton").text("Male") 
    Tap     android=UiSelector().className("android.widget.RadioButton").text("Male") 
    Wait Until Page Contains Element    id=com.material.components:id/bt_save_input 
    Tap     id=com.material.components:id/bt_save_input



