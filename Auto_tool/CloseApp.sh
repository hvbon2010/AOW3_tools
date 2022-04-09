#!/bin/bash

PACK_NAME="com.geargames.aow"

adb -s $ADB_DEVICE_NAME shell am force-stop $PACK_NAME
# Close app in recent app
adb -s $ADB_DEVICE_NAME shell input keyevent KEYCODE_APP_SWITCH
sleep 2
# adb -s $ADB_DEVICE_NAME shell input keyevent KEYCODE_DPAD_DOWN
# adb -s $ADB_DEVICE_NAME shell input keyevent DEL

# adb -s $ADB_DEVICE_NAME shell input swipe 795 221 795 814 100

# close recentapps list
# adb -s $ADB_DEVICE_NAME shell input tap 1139 117
adb -s $ADB_DEVICE_NAME shell input tap 795 1750