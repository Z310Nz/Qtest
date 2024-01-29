*** Settings ***
Documentation    
Library           SeleniumLibrary
 
Suite Setup       Open Browser    ${url}    chrome
 
*** Variables ***
${URL}             http://automationexercise.com
${MAINCLASS}       Automation
${REGI_BTN}        xpath=//a[@href='/login']
${NAME}            Pratya
${EMAIL}           p.daddasddedadsadddaswdrwdwsasasdddwqdasdsdwqweqweedasdfwweqdsdwp@gmail.com
${NAME_INPUT}      name:name
${EMAIL_INPUT}     xpath=//input[@type='email' and @data-qa='signup-email']
${SIGN_UP_BTN}     xpath=//button[contains(text(),'Signup')]
${SIGN_UP_PAGE}    Enter Account Information
${GENDER_RADIO}    id:id_gender1
${DAYS_DROPDOWN}    id=days
${MONTHS_DROPDOWN}    id=months
${YEARS_DROPDOWN}    id=years
${COUNTRY_DROPDOWN}    id=country
*** Keywords ***
Check Page
   Wait Until Page Contains        ${MAINCLASS}
Click Register
   Click Element                   ${REGI_BTN}
Input Name
   [Arguments]              ${NAME}
   Input Text    ${NAME_INPUT}    ${NAME}
 
Input Email
   [Arguments]              ${EMAIL}
   Input Text    ${EMAIL_INPUT}    ${EMAIL}
Click Signup
   Click Element    ${SIGN_UP_BTN}
Check SignupPage
   Wait Until Page Contains        ${SIGN_UP_PAGE}
Click Gender
   Click Element    ${GENDER_RADIO}
 
*** Test Cases ***
Reigstering
   [Documentation]
   Check Page
   Click Register
   Input Name        ${NAME}
   Input Email       ${EMAIL}
   Click Signup
   Check SignupPage
   Click Gender
    Input Text    id=first_name    Pratya
    Input Text    id=last_name    Palee
    Input Text    id=password    1234567890
    Select From List By Value    ${DAYS_DROPDOWN}    15
    Select From List By Value    ${MONTHS_DROPDOWN}    10
    Select From List By Value    ${YEARS_DROPDOWN}    2002
    Select Checkbox    id=newsletter
    Select Checkbox    id=optin
    Input Text    id=company    Z310Nz
    Input Text    id=address1    1 moo 6
    Input Text    id=address2    Sridonchai
    Select From List By Value    ${COUNTRY_DROPDOWN}    Singapore
    Input Text    id=state    CR
    Input Text    id=city    Thong
    Input Text    id=zipcode    57230
    Input Text    id=mobile_number    0987654321
    Click Element    xpath=//button[contains(text(),'Create Account')]
    Page Should Contain  ACCOUNT CREATED!
    Click Element  xpath=//*[@id="form"]/div/div/div/div/a
    Page Should Contain  Logged in as Pratya
    Click Element  xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
    Page Should Contain  ACCOUNT DELETED!
    Click Element  xpath=//*[@id="form"]/div/div/div/div/a
    Close Browser