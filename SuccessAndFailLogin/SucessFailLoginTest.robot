*** Settings ***
Library           SeleniumLibrary
Resource          Keywords.robot

*** Variables ***
${Browser}        chrome
${SiteUrl}        https://opensource-demo.orangehrmlive.com/index.php/auth/login
&{Credential}     user=Admin    pass=admin123
${WrongPW}        Wrong    # This Is Wrong Password

*** Test Cases ***
SuccessLoginTest
    [Tags]    success
    Open my Browser    ${SiteUrl}    ${Browser}
    UserName    ${Credential}[user]
    Password    ${Credential}[pass]
    Login
    Verify Success Login
    Close All Browsers

FailLoginTest
    [Tags]    fail
    Open my Browser    ${SiteUrl}    ${Browser}
    UserName    ${Credential}[user]
    Password    ${WrongPW}
    Login
    Verify Fail Login
    Close All Browsers
