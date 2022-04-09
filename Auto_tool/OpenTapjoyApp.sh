#!/bin/bash

echo "Open the Tapjoy activity..."

# Tap to reward
adb -s $ADB_DEVICE_NAME shell input tap 1530 55

# Scroll down to end of gold earning
adb -s $ADB_DEVICE_NAME shell input swipe 750 678 750 263 100

# Tap to free gold
adb -s $ADB_DEVICE_NAME shell input tap 1040 682

# Tap to get free gold button
adb -s $ADB_DEVICE_NAME shell input tap 1378 378
