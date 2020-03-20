*** Settings ***
Documentation  This is some basic info about the whole test suite of infotiv rental car webpage
Resource       ../Resources/keywords.robot
Library        SeleniumLibrary
Library        DateTime

Test Setup     Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER} =  chrome
${URL} =  http://rental30.infotiv.net/

*** Test Cases ***
User Can Access Infotiv Home Page
    [Documentation]  This is to access the infotiv home page
    [Tags]           Test_HomePage

    Load Page
    Verify Title Of Home Page
    Verify Title Of Home Page Is Clickable
    Verify Home Page Logo Is Clickable


User Cannot Login With Invalid Credentials
    [Documentation]  This is used to test a negative test case
    [Tags]           Test_Login
    Load Page
    Verify Login Functionality With Wrong Credentials
    Sleep  2s


User Can Check BVA For The Start Date
    [Documentation]  This is used to check the BVA for the start date
    [Tags]           Test_BVA
    Load Page
    Verify Display Start Date Is Current Date Or Not
    Verify The Min Date For The Start Date
    Verify The Max Date For The Start Date
    Verify Less A Day From Min Date (Invalid) For The Start Date
    Verify Add A Day To Max Date (Invalid) For the Start Date
    Sleep  2s


User Can Check The Equivalence Partition For The Start Date
    [Documentation]  This is to check the Equivalence Partition for the start date
    [Tags]           Test_Equivalence
    Load Page
    Verify Selected Start Date Should Be Between Min and Max Values
    Sleep  2s


User Can Book A Car
    [Documentation]  This is the flow how the user can book a car
    [Tags]           Test_CarBookingFunctionality
    Load Page
    Verify User Login Functionality
    Verify The User Is In The Home Page Ater Login In
    Choose Start And End Dates To Book A Car
    Verify Car Booked Date Is Correct Or Not
    Select Type Of Car
    Verify The Confirmation Of The Booking Car
    Confirm Booking Of User Selected Car
    Verify The Confirmation Message
    Should Be able to verify whether car is booked or not
    Sleep  2s


Car Booking Functionality Using Gherkins Syntax
    [Documentation]  Given that user can be able to book a car When the user sign in with proper credentials and provide proper data  Then the User should be able to book a car and can view the message
    [Tags]           VG_test_Gherkins
    Load Page
    User Shiould Be Able To Book A Car


#Register User Account
#    [Documentation]     To Sign In The User Has To Register First
#    [Tags]              TestUserRegistration
#    Create User And Verify Whether The User Is Created Or Not