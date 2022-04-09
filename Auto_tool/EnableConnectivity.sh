#!/bin/bash

if [ "$1" = wifi ]
then
  echo "Enable wifi network..."
  adb -s $ADB_DEVICE_NAME shell "svc wifi enable"
elif [ "$1" = mobile ]
then
  echo "Enable mobile data network..."
  adb -s $ADB_DEVICE_NAME shell "svc data enable"
elif [ "$1" = all ]
then
  echo "Enable wifi network..."
  adb -s $ADB_DEVICE_NAME shell "svc wifi enable"
  echo "Enable mobile data network..."
  adb -s $ADB_DEVICE_NAME shell "svc data enable"
fi