#!/bin/bash

echo "Open the aow3 game..."

# Open aow3
# Main activity: com.trophit.MyUnityPlayerActivity
# Tapjoy activity: com.tapjoy.TJAdUnitActivity

adb -s $ADB_DEVICE_NAME shell am start -n com.geargames.aow/com.trophit.MyUnityPlayerActivity
