***Settings***
Library     SeleniumLibrary
Library     String
Resource    ../TestData/EcommerceTesData.robot
Resource    ../ObjectRepository/Locators.robot
Resource    ../Keywords/CommonKeywords.robot

***Keywords***

Navigate to desired Category
    Click Tab    ${desktop}  
    Wait Until Element Is Visible    ${SHOW_ALL_LINKS}    ${MED_WAIT_TIMEOUT}
    Click Element    ${SHOW_ALL_LINKS}  
    Select Value From DropDown    ${sortByfilterDropdown}    ${sortByfilterValue}    
    
Add Items to Cart 
      :FOR    ${index}    IN RANGE    1    3 
    \    ${addToBasket} =   Catenate      ${ADD_TO_CART_BUTTON}    [${index}]
    \    Click Element    ${ADD_TO_CART_BUTTON}
   
Verify Item Added to Cart
    Click Element Using JavaScript    ${CART_ICON}
    Page Should Contain Element    ${ITEM_TEXTBOX} 
    ${screenshot}     Capture Page Screenshot in Directory    ItemAdded        
    
    
    