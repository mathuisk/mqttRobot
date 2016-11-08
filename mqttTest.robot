*** Settings ***
Library          MQTTLibrary
Documentation    Testataan syöttää mqtt:n kautta informaatiota serverille

*** Variables ***

*** Test Cases ***
Open connection to server
    Connect    127.0.0.1    port=1883

Send data
    Publish    topic=test    message=test message
    Publish    topic=test    message=test message 2
    Publish    topic=test    message=test message 3
    Publish    topic=test    message=test message 4
    Publish    topic=test    message=test message 5

Close connection
    Disconnect

*** Keywords ***