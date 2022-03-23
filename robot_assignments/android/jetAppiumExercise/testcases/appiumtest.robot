*** Settings ***
Resource        ${CURDIR}/../import.robot

*** Test Cases ***
Open Test Applcation For Android
    features.Open Test Application
    login.Click Sign In
    login.Input Mobile Phone Number       0814904200 
    login.Click Continue Mobile Phone Number
    login.Input Pin   123456
    Click The One Today   
    Go Back After Notice Element        ${TodayArticleContainer} 
    Click The One Family
    Go Back After Notice Element    ${FamilyContainer} 
    Click The One Mission
    Go Back After Notice Element    ${missionStatusContainer}
    Click Cash Coupon
    Go Back After Notice Element    ${vsEcashContainer} 

    
