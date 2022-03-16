*** Settings ***
Library     AppiumLibrary
*** Variables ***
${signInButtonId}       th.co.the1.the1app.uat:id/btLogin
${continueButtonId}     th.co.the1.the1app.uat:id/btGreetingContinue
*** Keywords ***
Click Sign In
    Wait Until Page Contains Element     id=${signInButtonId}
    Tap         id=${signInButtonId}
Input Mobile Phone Number
    [Arguments]     ${phoneNumber}
    Wait Until Page Contains Element    id=th.co.the1.the1app.uat:id/etSpinnerTextInputPrimary
    Input Text      id=th.co.the1.the1app.uat:id/etSpinnerTextInputPrimary      ${phoneNumber}
Click Continue Mobile Phone Number
    Tap     ${continueButtonId} 
Input Pin
    [Arguments]     ${pin}
    Wait Until Page Contains Element        id=th.co.the1.the1app.uat:id/mtptiPinEntry
    Input Text  id=th.co.the1.the1app.uat:id/mtptiPinEntry      ${pin}
