*** Settings ***
Library     SeleniumLibrary
Library     String
Library     BuiltIn

Resource    ${CURDIR}/keywords/common.robot
#features
Resource    ${CURDIR}/keywords/features/features.robot
Resource    ${CURDIR}/keywords/features/login_feature.robot
Resource    ${CURDIR}/keywords/features/cart_feature.robot
Resource    ${CURDIR}/keywords/features/product_feature.robot
Resource    ${CURDIR}/keywords/features/search_feature.robot
#pages
Resource    ${CURDIR}/keywords/pages/login_page.robot
Resource    ${CURDIR}/keywords/pages/head.robot
Resource    ${CURDIR}/keywords/pages/product_detail_page.robot
Resource    ${CURDIR}/keywords/pages/search_result_page.robot 
Resource    ${CURDIR}/keywords/pages/home_page.robot 