*** settings ***
Library         SeleniumLibrary 

*** Test cases *** 
Basic Robotframework
     open browser       file:///C:/Users/Doppio3/Desktop/Web%20Automate/RobotFramework%20web%20ep1/ep01_small_excercise.html        chrome
     input text         xpath=//input[@id='username-box']          Suwijak
     input text         xpath=//div[@v='password']/input           password
     input text         xpath=//input[@doppio='nickname']          Tan
     select from list by value             xpath=//select          doppio
     click button       xpath=//input[@id='op1']                   
     click button       xpath=//button[@id='use-me'] 