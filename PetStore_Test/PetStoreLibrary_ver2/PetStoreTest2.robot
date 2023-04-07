*** Settings ***
Documentation   The second version of testing the API of the Swagger Petstore sample website, via "RequestsLibrary"
Library    Collections
Library    RequestsLibrary


*** Variables ***
${website_url}  https://petstore.swagger.io/v2


*** Test Cases ***
Create User
# Create user
    ${user}    Create Dictionary    id=1     username=JonS    firstName=Jon    lastName=Snow    email=jonsnow@gmail.com    password=jonny    phone=1234567890   userStatus=0
    ${post_response}     POST    ${website_url}/user     json=${user}    expected_status=200
    Log    ${post_response.json()}

Check User
# Get user by username
    ${get_response}    GET     ${website_url}/user/JonS     expected_status=200
    Log    ${get_response.json()}
    Should Be Equal As Strings    ${get_response.json()}[username]    JonS
    Should Be Equal As Strings    ${get_response.json()}[firstName]    Jon
    Should Be Equal As Strings    ${get_response.json()}[lastName]    Snow
    Should Be Equal As Strings    ${get_response.json()}[email]    jonsnow@gmail.com
    Should Be Equal As Strings    ${get_response.json()}[phone]    1234567890

Update User
# Update user
    ${user}     Create Dictionary   id=1     username=JonS    firstName=Jon    lastName=Snow    email=jonsnow@gmail.com    password=jonny123    phone=9876543210   userStatus=0
    ${put_response}    PUT     ${website_url}/user/JonS     json=${user}    expected_status=200
    Log    ${put_response.json()}

Check User Again
# Get user by username
    ${get_response}    GET     ${website_url}/user/JonS     expected_status=200
    Log    ${get_response.json()}
    Should Be Equal As Strings    ${get_response.json()}[username]    JonS
    Should Be Equal As Strings    ${get_response.json()}[firstName]    Jon
    Should Be Equal As Strings    ${get_response.json()}[lastName]    Snow
    Should Be Equal As Strings    ${get_response.json()}[email]    jonsnow@gmail.com
    Should Be Equal As Strings    ${get_response.json()}[phone]    9876543210

Delete User
    # Delete user
    ${delete_response}  DELETE  ${website_url}/user/JonS    expected_status=200
    Log    ${delete_response.json()}






