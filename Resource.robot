*** Settings ***
Resource    Valid_Login.robot
*** Test Cases ***
TC01 Positive LogIn test
    Open Browser To Login Page
	Input Username    student
    Input Pass-Word    Password123
	Submit Credentials
	Login Success Page Should Be Open
    Verify new page contains expected text
	Verify button Log out is displayed on the new page
	[Teardown]    Close Browser

TC02 Negative username test
    Open Browser To Login Page
    Input Username    incorrectUser 
    Input Pass-Word    Password123
	Submit Credentials
	Verify error message is displayed
    Verify error message text is Your username is invalid!
    [Teardown]    Close Browser

TC03 Negative password test
    Open Browser To Login Page
 	Input Username    student
	Input Pass-Word    incorrectPassword 
	Submit Credentials
	Verify error message is displayed
    Verify error message text is Your password is invalid!
	[Teardown]    Close Browser