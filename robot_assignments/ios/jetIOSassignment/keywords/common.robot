*** Variable ***
${loading_screen_xpath}     //XCUIElementTypeOther/XCUIElementTypeImage

*** Keywords ***
Open Test Application
    Open Application       remote_url=http://localhost:4723/wd/hub 
    ...                     automationName=XCUItest    
    ...                    deviceName=iPhone 12 Pro Max   
    ...                    platformVersion=15.2
    ...                    platformName=ios
    ...                    autoAcceptAlerts=true
    ...                    bundleId=th.co.officemate.staging
    #After Open Application, sometimes it going too fast, so it should wait for loading screen after open application
    Wait Until Element Is Visible    ${loading_screen_xpath}     1min