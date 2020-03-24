*** Settings ***
Library                 SeleniumLibrary
*** Keywords ***
Begin Web Test
        Open Browser                   about:blank   chrome
        Maximize Browser Window
        Load Page
        Verify Page Loaded

Load Page
        Go To                          http://rental23.infotiv.net/

Verify Page Loaded
        Wait Until Page Contains        Infotiv Car Rental

End Web Test
         Close Browser

Creating the User
        Click Button                    id:createUser
        Input Text                      id:name             Joseph
        Input Text                      id:last             Alfred
        Input Text                      id:phone            0739243786
        Input Text                      id:emailCreate      alfred.josephalfred@gmail.com
        Input Text                      id:confirmEmail     alfred.josephalfred@gmail.com
        Input Text                      id:passwordCreate   123456
        Input Text                      id:confirmPassword  123456
        Click Button                    id:create

Login Function
        Element Should Be Visible       id:userInfoTopBottom
        Input Text                      id:email            alfred.josephalfred@gmail.com
        Input Text                      id:password         123456
        Sleep                           5s
        Click Button                    id:login

Test with Invalid Email
        Input Text                      id:email            alfred.josephalfred@gmail.com
        Input Text                      id:password         1234567
        Sleep                           5s
        Click Button                    id:login
        Element Should Be Visible       id:signInError

Test with Invlaid Password
        Input Text                      id:email            alfred.josephalfred@gmail.net
        Input Text                      id:password         123456
        Sleep                           5s
        Click Button                    id:login
        Element Should Be Visible       id:signInError

Date Selection
        Click Element                        id:start
        Press Keys                           id:start               {03/20}
        Press Keys                           id:end                 {03/27}
        Sleep                                5s
        Click Button                        id:continue

Booking a Car
        Click Button                         xpath://*[@id="ms-list-1"]/button
        Select Checkbox                      id:ms-opt-1
        Click Button                         xpath://*[@id="ms-list-2"]/button
        Select Checkbox                      id:ms-opt-5
        Click Element                        id:rightpane
        Sleep                                2s
        Click Element                        id:carSelect1
        ${pickup_date} =                    Get Text                id:startDate
        Should Be Equal                     ${pickup_date}          Pickup date: 2020-03-20
        ${return_date} =                    Get Text                id:endDate
        Should Be Equal                     ${return_date}          Return date: 2020-03-27
        Input Text                          id:cardNum              1234567887654321
        Input Text                          id:fullName             J Alfred
        Select From List By Index            xpath://*[@id="confirmSelection"]/form/select[1]    2
        Select From List By Index            xpath://*[@id="confirmSelection"]/form/select[2]    5
        Input Text                           id:cvc               123
        Click Button                         id:confirm
        Wait Until Page Contains             now ready for pickup