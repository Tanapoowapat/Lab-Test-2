*** Settings ***
Library           requests


*** Keywords ***
Get HelloWorld
    ${response}=    Get    http://127.0.0.1:5001/

    #Check status code
    Should Be Equal    ${response.status_code}    ${200}

    #Get response body
    [return]    ${response.content}

Get Is_prime
    [Arguments]   ${number}
    ${response}=    Get    http://127.0.0.1:5001/is_prime/${number} 

    #Check status code
    Should Be Equal    ${response.status_code}    ${200}

    #Get response body
    [return]    ${response.content}

*** Test Cases ***
Test HelloWorld
    ${response}=    Get HelloWorld
    Should Be Equal As Strings    ${response}    Hello, World!

Test Is_prime_1
    ${response}=    Get Is_prime    ${17}
    Should Be Equal As Strings    ${response}    True

Test Is_prime_equal_36
    ${response}=    Get Is_prime    ${36}
    Should Be Equal As Strings    ${response}    False


Test Is_prime_equal_13219
    ${response}=    Get Is_prime    ${13219}
    Should Be Equal As Strings    ${response}    True
