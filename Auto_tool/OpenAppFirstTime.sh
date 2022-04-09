#!/bin/bash

echo "Open the aow3 game..."

# Open aow3
# Main activity: com.trophit.MyUnityPlayerActivity
# Tapjoy activity: com.tapjoy.TJAdUnitActivity

adb -s $ADB_DEVICE_NAME shell am start -n com.geargames.aow/com.trophit.MyUnityPlayerActivity

sleep 30
# sleep 20

# restore account
# adb -s $ADB_DEVICE_NAME shell input tap 1432 30
adb -s $ADB_DEVICE_NAME shell input tap 2050 50

sleep 20
# sleep 10

# select account
# adb -s $ADB_DEVICE_NAME shell input tap 727 597
if [ "$1" = hvbon1996 ]
then
## For the first account
adb -s $ADB_DEVICE_NAME shell input tap 1020 430
elif [ "$1" = hvbon2010 ]
then
## For the second account
adb -s $ADB_DEVICE_NAME shell input tap 1020 615
elif [ "$1" = bban9063 ]
then
## For the second account
adb -s $ADB_DEVICE_NAME shell input tap 1020 784
fi

# wait for login and load game
sleep 60

# # allow audio
# adb -s $ADB_DEVICE_NAME shell input tap 791 476
# sleep 2
# adb -s $ADB_DEVICE_NAME shell input tap 959 516

# #wait for load to game
# sleep 30

# # allow storage permission
# adb -s $ADB_DEVICE_NAME shell input tap 791 476
# sleep 2
# adb -s $ADB_DEVICE_NAME shell input tap 961 566
# sleep 2

# # turn off notifications
# adb -s $ADB_DEVICE_NAME shell input tap 1332 104
# sleep 2

# # turn off contract menu
# adb -s $ADB_DEVICE_NAME shell input tap 1456 117
# sleep 20
