*** Settings ***
Library         Selenium2Library
Library         AutoItLibrary
*** Variables ***
@{URL_TRM_RE_DESIGN_NODE_2}         http://sff-uat.true.th:19081/redesign-trm/?shop_code=80000012&queue_id=_&channel=INTRANET       ie
${LOCATOR_SECURITY_CERTIFICATE}     id=overridelink
${USERNAME}                         warahttps://xxo-uat.true.th
${USERNAME_FIELD}                   id=IDToken1

*** Test Cases ***
test login phantomJS
                Open Browser        http://www.google.co.th         gc
                Input Text    name=q         test12345678

***comment***
test locator ie
                Open Browser        http://www.google.co.th         ie
                Input Text    name=q         test12345678


Login_Redesign
    Open Browser    @{URL_TRM_RE_DESIGN_NODE_2}
    Maximize Browser Window
    Click X
    Input Username


*** Keywords ***
Click Security Certificate Link
    Wait Until Element Is Visible    ${LOCATOR_SECURITY_CERTIFICATE}    5s
    Click Element    ${LOCATOR_SECURITY_CERTIFICATE}

Input Username
    Wait Until Element Is Visible    ${USERNAME_FIELD}    5s
    Input Text    ${USERNAME_FIELD}    ${USERNAME}

Click X
    Sleep    5s
    Wait For Active Window    WindowTitle=Certificate Error: Navigation Blocked - Internet Explorer    TimeOut=10
    Mouse Click    strButton=LEFT    nX=209    nY=396    nClicks=1    nSpeed=-1
