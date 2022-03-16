*** Settings ***
Resource        ${CURDIR}/../import.robot

*** Test Cases ***
Open Test Applcation For Android
    Open Test Application
    Click Sign In
    Input Mobile Phone Number       0814904200 
    Click Continue Mobile Phone Number
    Input Pin   123456

    Click The One Today
    Wait Until Element Is Visible  ${TodayArticleContainer}    
    Go Back

    Click The One Family
    Wait Until Element Is Visible    ${FamilyContainer} 
    Go Back

    Click The One Mission
    Wait Until Element Is Visible     ${missionStatusContainer}
    Go Back

    Click Cash Coupon
    Wait Until Element Is Visible     ${vsEcashContainer} 
    Go Back    

    
