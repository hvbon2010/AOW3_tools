#!/bin/bash

# Currently, we in the main screen (with no adv screen)

# open the gift tab
adb -s $ADB_DEVICE_NAME shell input tap 1096 60
sleep 1

# open the free box (blue box)
adb -s $ADB_DEVICE_NAME shell input tap 1016 335
# adb -s $ADB_DEVICE_NAME shell input tap 1016 439
sleep 5

# tap to free box to getgift
adb -s $ADB_DEVICE_NAME shell input tap 812 670
sleep 1
adb -s $ADB_DEVICE_NAME shell input tap 812 670
sleep 1
adb -s $ADB_DEVICE_NAME shell input tap 812 670
sleep 1
adb -s $ADB_DEVICE_NAME shell input tap 812 670
sleep 1
adb -s $ADB_DEVICE_NAME shell input tap 812 670
sleep 1
adb -s $ADB_DEVICE_NAME shell input tap 812 670

# tap to adv button to get more gift
adb -s $ADB_DEVICE_NAME shell input tap 670 773

# wait for loading adv and watch done
sleep 40

# back to get gift
adb -s $ADB_DEVICE_NAME shell input keyevent KEYCODE_BACK
sleep 5

# tap to adv button to get more gift (in the end of list gifts)
## for 3 gifts
adb -s $ADB_DEVICE_NAME shell input tap 1037 314
## for 4 gifts
adb -s $ADB_DEVICE_NAME shell input tap 1159 314

# wait for loading adv and watch done
sleep 40

# back to get gift
adb -s $ADB_DEVICE_NAME shell input keyevent KEYCODE_BACK
sleep 5

# Tap to receive gifts
adb -s $ADB_DEVICE_NAME shell input tap 806 777
sleep 5
