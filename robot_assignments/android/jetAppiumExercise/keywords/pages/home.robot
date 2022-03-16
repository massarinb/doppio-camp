*** Settings ***
Library     AppiumLibrary
*** Variables ***
${theOneTodayButton}    //android.view.ViewGroup[android.widget.TextView[@text='The 1 ${\n}Today']]
${theOneFamilyButton}   //android.view.ViewGroup[android.widget.TextView[@text='The 1 ${\n}Family']]
${theOneMissionButton}      //android.view.ViewGroup[android.widget.TextView[@text='The 1 ${\n}Mission']]
${cashCouponButton}     //android.view.ViewGroup[android.widget.TextView[@text='Cash ${\n}Coupon']]
*** Keywords ***
Click The One Today
    Wait Until Element Is Visible  ${theOneTodayButton} 
    Tap     ${theOneTodayButton} 
Click The One Family
    Wait Until Element Is Visible  ${theOneFamilyButton} 
    Tap     ${theOneFamilyButton} 
Click The One Mission
    Wait Until Element Is Visible  ${theOneMissionButton} 
    Tap     ${theOneMissionButton} 
Click Cash Coupon
    Wait Until Element Is Visible  ${cashCouponButton} 
    Tap     ${cashCouponButton} 