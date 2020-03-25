*** Settings ***
Documentation  This is some basic info about the whole test suite of infotiv rental car webpage
Resource       ../Resources/keywords.robot
Library        SeleniumLibrary
Library        DateTime

Test Setup     Begin Web Test
Test Teardown  End Web Test




*** Test Cases ***
User Can Access Infotiv Home Page
    [Documentation]  This is to access the infotiv home page
    [Tags]           Test_HomePage
    Verify Title Of Home Page
    Verify Title Of Home Page Is Clickable
    Verify Home Page Logo Is Clickable


User Cannot Login With Invalid Credentials
    [Documentation]  This is used to test a negative test case
    [Tags]           Test_Login
    Verify Login Functionality With Wrong Credentials



#User Can Check BVA For The Start Date
    #[Documentation]  This is used to check the BVA for the start date
    #[Tags]           Test_BVA
    #Verify Display Start Date Is Current Date Or Not
    #Verify The Min Date For The Start Date
    #Verify The Max Date For The Start Date
    #Verify Less A Day From Min Date (Invalid) For The Start Date
    #Verify Add A Day To Max Date (Invalid) For the Start Date

User Can Check The Start Date using BVA
    [Documentation]  This is used to check display start date is current date or not using BVA
    [Tags]           Test_BVA_1
    Verify Display Start Date Is Current Date Or Not


User Can Check The Min Date For The Start Date
    [Documentation]  This is used to check the min date for the start date is current date or not using BVA
    [Tags]           Test_BVA_1.1
    Verify The Min Date For The Start Date


User Can Check The Max Date For The Start Date
    [Documentation]  This is used to check the max date for the start date is one month ahead from min date or not using BVA
    [Tags]           Test_BVA_1.2
    Verify The Max Date For The Start Date


User Can Check The Min Date For The Start Date By Lessing A Day(Invalid)
    [Documentation]  This is used to check the min date for the start date by lessing a day is current date or not using BVA
    [Tags]           Test_BVA_1.3
    Verify Less A Day From Min Date (Invalid) For The Start Date


User Can Check The Max Date For The Start Date By Adding A Day(Invalid)
    [Documentation]  This is used to check the max date for the start date by adding a day is one month ahead from min date or not using BVA
    [Tags]           Test_BVA_1.4
    Verify Add A Day To Max Date (Invalid) For the Start Date


User Can Check The Equivalence Partition For The Start Date
    [Documentation]  This is to check the Equivalence Partition for the start date
    [Tags]           Test_Equivalence_Partition
    Verify Selected Start Date Should Be Between Min and Max Values


User Can Book A Car
    [Documentation]  This is the flow how the user can book a car
    [Tags]           Test_CarBookingFunctionality
    User Login With Proper Credentials
    Verify User Login Functionality
    #Verify The User Is In The Home Page Ater Login In
    Choose Start And End Dates To Book A Car
    Verify Car Booked Date Is Correct Or Not
    Select Type Of Car
    Verify The Confirmation Of The Booking Car
    Confirm Booking Of User Selected Car
    Verify The Confirmation Message
    Should Be able to verify whether car is booked or not
    Should Be Able To Cancel Booking



Car Booking Functionality Using Gherkins Syntax
    [Documentation]  Given that user can be able to book a car by providing proper credentials When the user enters the proper data  Then the User should be able to book a car and can view the message
    [Tags]           VG_test_Gherkins
    Given User Login With Proper Credentials
    When User Shiould Be Able To Book A Car By Providing Proper Data
    Then User Should Be Able To View The Booked Car In MyPage



#Register User Account
#    [Documentation]     To Sign In The User Has To Register First
#    [Tags]              TestUserRegistration
#    Create User And Verify Whether The User Is Created Or Not