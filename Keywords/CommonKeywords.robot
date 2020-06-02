***Settings***
Library    SeleniumLibrary
Library    String
Library    DateTime
Resource    ../TestData/EcommerceTesData.robot
Resource    ../ObjectRepository/Locators.robot

***Variables***
${WAIT_TIMEOUT}        40
${MED_WAIT_TIMEOUT}    15
${WAIT_THREE}          3
${RETRY_COUNT}         5x

***Keywords***
Launch Open Cart Application
    Open Browser    ${url}     ${browser}  
    Maximize Browser Window
    ${screenshot}     Capture Page Screenshot in Directory    ApplicationLaunched
    
Create Dynamic xpath
    [Arguments]  ${MY_XPATH}  ${Value_SearchFor}  ${Value_ReplaceWith}
    ${SELECTOR}=  Replace String  ${MY_XPATH}  ${Value_SearchFor}  ${Value_ReplaceWith}
    [Return]  ${SELECTOR}
    
Click Tab
    [Arguments]    ${tabName}
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${REPLACABLE_LOCATOR}   ${MED_WAIT_TIMEOUT} 
    ${TAB_ELEMENT_RETURN}    Replace String    ${DYNAMIC_XPATH_TAB}     ${replacableVariable}    ${tabName}
    Wait Until Element Is Visible    ${TAB_ELEMENT_RETURN}   ${WAIT_TIMEOUT}
    Click Element    ${TAB_ELEMENT_RETURN}
    
Select Value From DropDown
    [Arguments]    ${dropdownFieldName}    ${dropdownFieldValue} 
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${REPLACABLE_LOCATOR}   ${MED_WAIT_TIMEOUT}  
    ${DROPDOWN_ELEMENT_RETURN}    Replace String    ${DYNAMIC_DROPDOWN}    ${replacableVariable}    ${dropdownFieldName} 
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${REPLACABLE_LOCATOR}   ${MED_WAIT_TIMEOUT}  
    Click Element   ${DROPDOWN_ELEMENT_RETURN}
    ${DROPDOWN_ELEMENT}    Replace String    ${DYNAMIC_DROPDOWN_XPATH}    ${replacableValue}    ${dropdownFieldValue} 
    Click Element    ${DROPDOWN_ELEMENT} 
    
Click Element Using JavaScript
    [Arguments]    ${ELEMENT_XPATH}
    ${ELEMENT_XPATH}=       Replace String      ${ELEMENT_XPATH}       \"  \\\
    Wait Until Keyword Succeeds    ${RETRY_COUNT}    ${WAIT_THREE}    Execute JavaScript  document.evaluate("${ELEMENT_XPATH}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    
Capture Page Screenshot in Directory   
   [Arguments]    ${screenshotName}
   ${timeStamp}    Create Date Timestamp   
   ${screenshotName}    Catenate    ${screenshotName}    ${timeStamp}
   Execute Javascript        document.body.style.zoom="75%"
   ${SCREENSHOT_IMG}=    Capture Page Screenshot   ${screenshotName}.png
   Execute Javascript        document.body.style.zoom="100%"            
   [Return]    ${SCREENSHOT_IMG} 
    
Create Date Timestamp
   ${date} =    Get Current Date
   ${date1}=    Replace String   ${date}  ${SPACE}    ${EMPTY}
   ${date2}=    Replace String   ${date1}  -   ${EMPTY}
   ${date3}=    Replace String   ${date2}  :    ${EMPTY}
   ${date4}=    Replace String   ${date3}  .    ${EMPTY}
   [Return]    ${date4}    
   
Logout Application
    Close Browser
    