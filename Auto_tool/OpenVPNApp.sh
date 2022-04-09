#!/bin/bash

echo "Open the vpn app ..."

# Open vpn app
# if [ "$1" = solo_vpn ]
# then
#     adb -s $ADB_DEVICE_NAME shell am start -n co.solovpn/co.easy4u.ll.ui.HomeActivity
# elif [ "$1" = easy_vpn ]
# then
#     adb -s $ADB_DEVICE_NAME shell am start -n com.easyovpn.easyovpn/com.easyovpn.easyovpn.ui.ServerListActivity
# else
#     echo "Please select vpn app!"
# fi
echo "Go to Home screen first..."
adb -s $ADB_DEVICE_NAME shell am start -a android.intent.action.MAIN -c android.intent.category.HOME
echo "Swipe to Second screen..."
adb -s $ADB_DEVICE_NAME shell input swipe 817 1804 218 1804 100
adb -s $ADB_DEVICE_NAME shell input swipe 817 1804 218 1804 100

# Open vpn app
if [ "$1" = solo_vpn ]
then
    echo "Open Solo VPN app..."
    adb -s $ADB_DEVICE_NAME shell input tap 135 1562
    echo "Waiting for initialization..."
    sleep 5
    adb -s $ADB_DEVICE_NAME shell input tap 533 542
elif [ "$1" = easy_vpn ]
then
    echo "Open Easy VPN app..."
    adb -s $ADB_DEVICE_NAME shell input tap 926 1544
    sleep 1
    echo "Allow permission app..."
    adb -s $ADB_DEVICE_NAME shell input tap 936 2055
    sleep 1
    adb -s $ADB_DEVICE_NAME shell input tap 877 1347
elif [ "$1" = gate_vpn ]
then
    echo "Open Gate VPN app..."
    adb -s $ADB_DEVICE_NAME shell am start -n vn.unlimit.vpngate/.activities.SplashActivity
else
    echo "Please select vpn app!"
fi