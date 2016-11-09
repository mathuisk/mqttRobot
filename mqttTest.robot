*** Settings ***
Library          MQTTLibrary
Library          DateTime
Documentation    Testing to send information to the mqtt server

*** Variables ***
${broker.url}     127.0.0.1
${broker.port}    1883

*** Test Cases ***
Open connection to server
    Connect    ${broker.url}    port=${broker.port}

Send simple data
    ${date}    Get Current Date    time_zone=UTC    result_format=%Y-%m-%dT%H:%M:%S.%fZ
    ${time}    Get Time    epoch #gives epoch time without decimals
    Publish    topic=test    message={"chan": 0,"cls": 0,"codr": "4/5","data": "MlftAg4CBgAXARYBRT9wAyAAUw==","datr": "SF7BW125","freq": "868.1","lsnr": "9.5","mhdr": "4007000000805988","modu": "LORA","opts": "","port": 2,"rfch": 0,"rssi": -70,"seqn": 34905,"size": 28,"timestamp": "${date}","tmst": ${time}}

Sleep for 5 seconds between tests
    Sleep    5

Send more data
    ${date}    Get Current Date    time_zone=UTC    result_format=%Y-%m-%dT%H:%M:%S.%fZ
    ${time}    Get Time    epoch #gives epoch time without decimals
    Publish    topic=test    message={"chan": 0,"cls": 0,"codr": "4/5","data": "MlftAg4CBgAXARYBRT9wAyAAUw==","datr": "SF7BW125","freq": "868.1","lsnr": "9.5","mhdr": "4007000000805988","modu": "LORA","opts": "","port": 2,"rfch": 0,"rssi": -70,"seqn": 34905,"size": 28,"timestamp": "${date}","tmst": ${time}}

Close connection
    Disconnect

*** Keywords ***