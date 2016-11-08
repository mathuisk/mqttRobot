*** Settings ***
Library          MQTTLibrary
Documentation    Testataan syöttää mqtt:n kautta informaatiota serverille

*** Variables ***

*** Test Cases ***
Open connection to server
    Connect    127.0.0.1    port=1883

Send simple data
    ${time}    Get Time
    Publish    topic=test    message=Test message ${time}

#Send more data
#    Publish    topic=test    message=

Close connection
    Disconnect

*** Keywords ***