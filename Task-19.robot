*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://robotsparebinindustries.com
${BROWSER}     chrome
${USERNAME}    maria
${PASSWORD}    thoushallnotpass

*** Test Cases ***
Verify Login Functionality
    # Launch the Chrome browser
    Open Application
     # Enter the username
    Input Text    id=username    ${USERNAME}
    # Enter the password
    Input Password    id=password    ${PASSWORD}
    # Click the Login button
    Click Button    xpath=//button[@type='submit']
    Sleep    3s
    Verify Successful Login
    Logout
    Close Application

*** Keywords ***
Open Application
    # Launch the Chrome browser
    Open Browser    ${URL}    ${BROWSER}
    # Maximize the browser window
    Maximize Browser Window
    # Wait for 2 seconds to browser launch
    Sleep    2s
Verify Successful Login
    # Verify that the Logout button is displayed
    Element Should Be Visible    xpath=//button[@id='logout']
    Sleep    2s
    # Verify logged in username is visible
    Page Should Contain    ${USERNAME}

Logout
    # Click Logout button
    Click Button    xpath=//button[@id='logout']
    Sleep    3s

Close Application
    # Close the browser
    Close Browser