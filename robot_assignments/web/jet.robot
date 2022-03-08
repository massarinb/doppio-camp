*** setting ***
Library         SeleniumLibrary
*** test cases ***
test1
    Log  hello
testselenium

    #Open Browser    url=https://www.google.co.th/       browser=chrome
    Open Browser    url=file:///Users/jetdoppio/Desktop/ep01_small_excercise.html       browser=chrome
    Select From List By Label   //select    Doppio
    Click Element       //input[@name="vehicle1"]
    Click Element       //button[@id='use-me']
