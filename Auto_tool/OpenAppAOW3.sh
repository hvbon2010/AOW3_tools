#!/bin/bash

echo "Open the aow3 game..."

# Open aow3
# Main activity: com.trophit.MyUnityPlayerActivity
# Tapjoy activity: com.tapjoy.TJAdUnitActivity

adb -s $ADB_DEVICE_NAME shell am start -n com.geargames.aow/com.trophit.MyUnityPlayerActivity

# Wait for AWO3 load done
echo "Waiting for AWO3 load done..."
sleep 30

# Close the first activity
adb -s $ADB_DEVICE_NAME shell input keyevent KEYCODE_BACK
