#!/bin/bash

if [ "$1" = wifi ]
then
  echo "Disable wifi network..."
  adb -s $ADB_DEVICE_NAME shell "svc wifi disable"
elif [ "$1" = mobile ]
then
  echo "Disable mobile data network..."
  adb -s $ADB_DEVICE_NAME shell "svc data disable"
elif [ "$1" = all ]
then
  echo "Disable wifi network..."
  adb -s $ADB_DEVICE_NAME shell "svc wifi disable"
  echo "Disable mobile data network..."
  adb -s $ADB_DEVICE_NAME shell "svc data disable"
fi