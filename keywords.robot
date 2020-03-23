
*** Keywords ***
Begin Web Test
    Open Browser                about:blank   ${BROWSER}
    Maximize Browser Window


Load Page
    Go To                       ${URL}


Verify Title Of Home Page
    ${link_text} =      Get Text   xpath://*[@id="title"]
    Should Be Equal     ${link_text}    Infotiv Car Rental


Verify Title Of Home Page Is Clickable
    Click Element       id:title
    ${link_text} =      Get Text  id:questionText
    Should Be Equal     ${link_text}    When do you want to make your trip?


Verify Home Page Logo Is Clickable
    Click Element       id:logo
    ${link_text} =      Get Text  id:questionText
    Should Be Equal     ${link_text}    When do you want to make your trip?


Verify Login Functionality With Wrong Credentials
    Input Text      id:email    sdsf12433434
    Input Text      id:password   sdfs32434
    Click Button            id:login
    ${link_text} =          Get Text  id:signInError
    Should Be Equal         ${link_text}   Wrong e-mail or password



Verify Display Start Date Is Current Date Or Not
    ${selected_date} =       Get Value  id:start
    ${current_date} =        Get Current Date  local  result_format=%Y-%m-%d
    Should Be Equal          ${current_date}    ${selected_date}


Verify The Min Date For The Start Date
     ${min_value_start} =      Get Element Attribute   id:start   attribute=min
     ${current_date} =         Get Current Date  local  result_format=%Y-%m-%d
     Should Be Equal           ${current_date}    ${min_value_start}


Verify The Max Date For The Start Date
     ${min_value_start} =      Get Element Attribute   id:start   attribute=min
     ${max_value_start} =      Get Element Attribute   id:start   attribute=max
     ${newdate} =              Add Time To Date  ${min_value_start}  31 days   result_format=%Y-%m-%d
     Should Be Equal           ${newdate}    ${max_value_start}


Verify Selected Start Date Should Be Between Min and Max Values

       Click Element            id:start
       Press Keys               id:start                 {03-23}
       ${link_text} =            Get Value               id:start
       ${min_value_start} =      Get Element Attribute   id:start   attribute=min
       ${max_value_start} =      Get Element Attribute   id:start   attribute=max
       Should Be True      '${link_text}'<='${max_value_start}'
       Should Be True      '${link_text}'>='${min_value_start}'



Verify The Min Date For The End Date
    ${link_text} =            Get Value               id:start
    ${min_value_end} =        Get Element Attribute   id:end        attribute=min
    Should Be True           '${link_text}'=='${min_value_end}'
    #Element Attribute Value Should Be      id:end      attribute=min      Get Element Attribute   id:start   attribute=min


Verify The Max Date For The End Date
     ${max_value_end} =         Get Element Attribute   id:end   attribute=max
     ${min_value_end} =         Get Element Attribute   id:end   attribute=min
     ${newdate} =               Add Time To Date  ${min_value_end}  31 days   result_format=%Y-%m-%d
     Should Be True            '${newdate}'=='${max_value_end}'


Verify Less A Day From Min Date (Invalid) For The Start Date
        ${min_value_start} =                Get Element Attribute          id:start   attribute=min
        ${current_date} =                   Get Current Date          local  result_format=%Y-%m-%d
        ${current_date_less_A_day} =        Subtract Time From Date        ${current_date}  1 days
        Should Not Be Equal                 ${current_date_less_A_day}     ${min_value_start}


Verify Add A Day To Max Date (Invalid) For the Start Date
        ${min_value_start} =                Get Element Attribute           id:start   attribute=min
        ${max_value_start} =                Get Element Attribute           id:start   attribute=max
        ${new_max_value_add_A_day} =        Add Time To Date                ${max_value_start}  1 days
        Should Not Be Equal                 ${new_max_value_add_A_day}      ${max_value_start}


Verify User Login Functionality
    Input Text          id:email        rajani.lekkala@gmail.com
    Input Text          id:password     hariraj2031
    Click Button        id:login
    ${label_text}        Get Text         xpath://*[@id="welcomePhrase"]   #id:welcomePhrase
    Should Be Equal      ${label_text}    You are signed in as Rajani


Verify The User Is In The Home Page Ater Login In
    ${link_text} =      Get Text  id:questionText
    Should Be Equal     ${link_text}    When do you want to make your trip?


Choose Start And End Dates To Book A Car
    Click Element       id:start
    Press Keys          id:start     {03-23}
    Press Keys          id:end       {03-29}
    Click Element       id:continue


Verify Car Booked Date Is Correct Or Not
    ${link_text}        Get Text        xpath://*[@id="showQuestion"]/label
    Should Be Equal     ${link_text}    Selected trip dates: 2020-03-23 – 2020-03-29


Select Type Of Car
    Click Button        xpath://*[@id="ms-list-1"]/button
    Select Checkbox     id:ms-opt-3
    Click Button        xpath://*[@id="ms-list-2"]/button
    Select Checkbox     id:ms-opt-6
    Click Element       id:rightpane
    sleep               3s
    Wait Until Page Contains Element    id:carSelect1
    Click Element       id:carSelect1


Verify The Confirmation Of The Booking Car
    Element Should Contain     id:questionText     Confirm booking of Tesla


Confirm Booking Of User Selected Car
    Input Text                      id:cardNum      1234567891234567
    Input Text                      id:fullName     rajani
    Select From List By Index       xpath://*[@id="confirmSelection"]/form/select[1]    7
    Select From List By Index       xpath://*[@id="confirmSelection"]/form/select[2]   4
    Input Text                      id:cvc      123
    Click Button                    id:confirm


Verify The Confirmation Message
    Element Should Contain      id:questionTextSmall    pickup 2020-03-23


Should Be able to verify whether car is booked or not
     Click Button                    id:mypage
     Table Column Should Contain     xpath://*[@id="middlepane"]/table       2        Tesla
     Table Column Should Contain     xpath://*[@id="middlepane"]/table       4        2020-03-23
     Table Column Should Contain     xpath://*[@id="middlepane"]/table       5        2020-03-29
     Table Column Should Contain     xpath://*[@id="middlepane"]/table       6        5



Create User And Verify Whether The User Is Created Or Not
    Click Button        id:createUser
    Input Text          id:name                 abc
    Input Text          id:last                 def
    Input Text          id:phone                0737623416
    Input Text          id:emailCreate          abc.def@gmail.com
    Input Text          id:confirmEmail         abc.def@gmail.com
    Input Text          id:passwordCreate       abcdef
    Input Text          id:confirmPassword      abcdef
    Click Button        id:create
    ${confirm_text}     Get Text                id:welcomePhrase
    Should Be Equal     ${confirm_text}         You are signed in as abc


User Shiould Be Able To Book A Car
     Input Text          id:email        rajani.lekkala@gmail.com
     Input Text          id:password     hariraj2031
     Click Button        id:login
     ${label_text}        Get Text        xpath://*[@id="welcomePhrase"]   #id:welcomePhrase
     Should Be Equal     ${label_text}    You are signed in as Rajani
     ${link_text} =      Get Text  id:questionText
     Should Be Equal     ${link_text}    When do you want to make your trip?
     Click Element       id:start
     Press Keys          id:start     {03-23}
     Press Keys          id:end       {03-29}
     Click Element       id:continue
     ${link_text}        Get Text        xpath://*[@id="showQuestion"]/label
     Should Be Equal     ${link_text}    Selected trip dates: 2020-03-23 – 2020-03-29
     Click Button        xpath://*[@id="ms-list-1"]/button
     Select Checkbox     id:ms-opt-3
     Click Button        xpath://*[@id="ms-list-2"]/button
     Select Checkbox     id:ms-opt-6
     Click Element       id:rightpane
     Click Element       id:carSelect1
     Element Should Contain         id:questionText     Confirm booking of Tesla
     Input Text                     id:cardNum          1234567891234567
     Input Text                     id:fullName         rajani
     Select From List By Index      xpath://*[@id="confirmSelection"]/form/select[1]    7
     Select From List By Index      xpath://*[@id="confirmSelection"]/form/select[2]   4
     Input Text                     id:cvc              123
     Click Button                   id:confirm
     Element Should Contain         id:questionTextSmall    pickup 2020-03-23
     Click Button                   id:mypage
     Click Button                   id:mypage
     Table Column Should Contain     xpath://*[@id="middlepane"]/table       2        Tesla
     Table Column Should Contain     xpath://*[@id="middlepane"]/table       4        2020-03-23
     Table Column Should Contain     xpath://*[@id="middlepane"]/table       5        2020-03-29
     Table Column Should Contain     xpath://*[@id="middlepane"]/table       6        5


End Web Test
    Close Browser