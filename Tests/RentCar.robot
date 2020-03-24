*** Setting ***
Documentation        A test suite with a 5/five tests for valid login
...                  This test has a workflow that is created using keywords in
...                  the imported resource file.

Resource            ../Resources/keywords.robot
Library             SeleniumLibrary

Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Test Cases ***
Creating the User
        [Documentation]                 Creating the User
        [Tags]                          Test 1 Creating User
        Creating the User
        Set Selenium Speed          0.5

Login Function
        [Documentation]                Testing Login function
        [Tags]                         Test 2 Login
        Login Function

Test with Invalid Email
        [Documentation]             Testing with invlaid Email
        [Tags]                      Test 3 Invalid Email
        Test with Invalid Email

Test with Invlaid Password
        [Documentation]             Tesing with invlaid password
        [Tags]                      Test 4 Invlaid Password
        Test with Invlaid Password

Date Selection
        [Documentation]             Testing date Function
        [Tags]                      Test 5 Selecting Date function
        Date Selection

Booking a Car
        [Documentation]             Testing to book a car
        [Tags]                      Test 6 Booking of a car
        Date Selection
        Login Function
        Booking a Car