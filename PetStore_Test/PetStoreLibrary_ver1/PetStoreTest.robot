*** Settings ***
Documentation   The first version of testing the API of the Swagger Petstore sample website, via custom library "PetStoreLibrary.py"
Library    PetStoreLibrary.py


*** Test Cases ***

Create User
    # Create user
    ${user}    create dictionary    id=1     username=JonS    firstName=Jon    lastName=Snow    email=jonsnow@gmail.com    password=jonny    phone=1234567890   userStatus=0
    ${response}    create_user    ${user}
    Should Be Equal As Strings    ${response['code']}    200

Check User
    # Get user by username
    ${response}    get_user_by_username    JonS
    Should Be Equal As Strings    ${response['username']}    JonS
    Should Be Equal As Strings    ${response['firstName']}    Jon
    Should Be Equal As Strings    ${response['lastName']}    Snow
    Should Be Equal As Strings    ${response['email']}    jonsnow@gmail.com
    Should Be Equal As Strings    ${response['phone']}    1234567890

Update User
    # Update user
    ${updated_user}    create dictionary    id=1    username=JonS     firstName=Jon    lastName=Snow    email=josnow@gmail.com   password=jonny123    phone=9876543210    userStatus=0
    ${response}    update_user    JonS    ${updated_user}
    Should Be Equal As Strings    ${response['code']}    200

Check User Again
    # Get user by username
    ${response}    get_user_by_username    JonS
    Should Be Equal As Strings    ${response['username']}    JonS
    Should Be Equal As Strings    ${response['firstName']}    Jon
    Should Be Equal As Strings    ${response['lastName']}    Snow
    Should Be Equal As Strings    ${response['email']}    josnow@gmail.com
    Should Be Equal As Strings    ${response['phone']}    9876543210

Delete User
    # Delete user
    ${response}    delete_user    JonS
    Should Be Equal As Strings    ${response['code']}    200