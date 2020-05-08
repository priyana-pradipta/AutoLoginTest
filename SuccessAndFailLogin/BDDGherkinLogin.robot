*** Settings ***
Library           SeleniumLibrary
Resource          Keywords.robot

*** Variables ***
${Browser}        chrome
${SiteUrl}        https://opensource-demo.orangehrmlive.com/index.php/auth/login

*** Test Cases ***
Gherkin-Success
    [Tags]    gherkin1
    Given browser is opened to login page
    When I perform sign in as "Admin" with password "admin123"
    Then dashboard page should be open
    and close the browser

Gherkin-Fail
    [Tags]    gherkin2
    Given browser is opened to login page
    When I perform sign in as "Admin" with password "SomethingWrong"
    Then dashboard page should not be open
    and close the browser

*** Keywords ***
browser is opened to login page
    Open my Browser    ${SiteUrl}    ${Browser}

I perform sign in as "${user}" with password "${pwd}"
    UserName    ${user}
    Password    ${pwd}
    Log in

dashboard page should be open
    Verify Success Login

dashboard page should not be open
    Verify Fail Login

close the browser
    Close All Browsers
