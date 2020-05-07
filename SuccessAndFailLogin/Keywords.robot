*** Settings ***
Library           SeleniumLibrary
Variables         ../Locators.py

*** Keywords ***
Open my Browser
    [Arguments]    ${SiteUrl}    ${Browser}
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

UserName
    [Arguments]    ${username}
    Input Text    ${txt_Uname}    ${username}

Password
    [Arguments]    ${password}
    Input Text    ${txt_PWord}    ${password}

Log In
    Click Button    ${btn_LogIn}

Verify Success Login
    Location Should Be    https://opensource-demo.orangehrmlive.com/index.php/dashboard

Verify Fail Login
    Location Should Be    https://opensource-demo.orangehrmlive.com/index.php/auth/validateCredentials
