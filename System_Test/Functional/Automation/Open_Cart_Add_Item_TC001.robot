***Settings***
Library        SeleniumLibrary
Resource       ../../../Keywords/CommonKeywords.robot
Resource       ../../../Keywords/AddItem.robot
Test Setup     Launch Open Cart Application
Test Teardown  Logout Application   

*** Test Cases ***
Open_Cart_Add_Expensive_Item_to_Cart_TC001
         [Documentation]             
   ...    <b>Objective:</b>
   ...    Test Case to verify that the user is able to add expensive item to cart
   ...    <b>Pre-conditions:</b>
   ...    Test user should be able to log in to Open Cart Application
    Navigate to desired Category
    Add Items to Cart 
    Verify Item Added to Cart
    
    
    
    
    