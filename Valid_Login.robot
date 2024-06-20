*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Library    OperatingSystem

*** Variables ***
${SERVER}                https://practicetestautomation.com
${DELAY}                 0.3
${BROWSER}               chrome
${LOGIN URL}             ${SERVER}/practice-test-login/
${LOGIN SUCCESS URL}     ${SERVER}/logged-in-successfully/\
${Error Message}         xpath=//*[@id="error"]

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
	...    options=add_experimental_option("detach", True)
	Maximize Browser Window
	Set Selenium Speed    ${DELAY}
    Login Page To Be Open
Login Page To Be Open
    Title Should Be    Test Login | Practice Test Automation

Input Username
    [Arguments]    ${username}
	Input Text    id=username    ${username}

Input Pass-Word
    [Arguments]    ${password}
	Input Text    id=password   ${password}

Submit Credentials
    Click Button    id=submit

Login Success Page Should Be Open
    Location Should Be    ${LOGIN SUCCESS URL}

Verify new page contains expected text
    Location Should Be    ${LOGIN SUCCESS URL}
    Element Should Contain    xpath=//*[@id="loop-container"]/div/article/div[1]/h1    Logged In Successfully

Verify button Log out is displayed on the new page
    Element Should Contain    xpath=//*[@id="loop-container"]/div/article/div[2]/div/div/div/a    Log out

Verify error message is displayed
    Element Should Be Enabled    ${Error Message} 

Verify error message text is Your username is invalid!
    Element Should Contain    ${Error Message}    Your username is invalid!

Verify error message text is Your password is invalid!
    Element Should Contain    ${Error Message}    Your password is invalid!
