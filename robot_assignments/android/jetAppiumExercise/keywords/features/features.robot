*** Settings ***
Library     AppiumLibrary
Resource    ${CURDIR}/../pages/login.robot
Resource    ${CURDIR}/../pages/home.robot
Resource    ${CURDIR}/../pages/theOneFamily.robot
Resource    ${CURDIR}/../pages/theOneMission.robot
Resource    ${CURDIR}/../pages/theOneToday.robot
Resource    ${CURDIR}/../pages/cashCoupon.robot


*** Variables ***

*** Keywords ***
Open Test Application
    Open Application       remote_url=http://localhost:4723/wd/hub     
    ...                    deviceName=Pixel 2 API 32   
    ...                    platformVersion=12.0
    ...                    platformName=Android
    ...                 appPackage=th.co.the1.the1app.uat
    ...                 appActivity=th.co.the1.the1app.ui.screens.guest.GuestActivity