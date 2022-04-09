#!/bin/bash
echo "[INFO] Available VPN app: "
echo "1. solo_vpn"
echo "2. easy_vpn"
echo "3. gate_vpn"

echo ">>> Select VPN app: "
read varname

if [ $varname = 1 ]
then
    vpn_app="solo_vpn"
elif [ $varname = 2 ]
then
    vpn_app="easy_vpn"
elif [ $varname = 3 ]
then
    vpn_app="gate_vpn"
else
    echo "Please select VPN app!"
fi

# echo "[INFO] Connectivity: "
# echo "1. wifi"
# echo "2. mobile data"

# echo ">>> Select connectivity: "
# read varname

# if [ $varname = 1 ]
# then
#     connectivity="wifi"
# elif [ $varname = 2 ]
# then
#     connectivity="mobile"
# else
#     echo "[INFO] Please select connectivity!"
# fi

echo "[INFO] Available accounts: "
echo "1. hvbon2010"

echo ">>> Select account: "
read varname

if [ $varname = 1 ]
then
    account="hvbon2010"
else
    echo "Please select VPN app!"
fi

while true; do
    read -p "[INFO] Do you want use the VPN(Y/N)? " yn
    case $yn in
        [Yy]* ) USE_VPN=true; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Close apps
./CloseApp.sh

# Disable connectivity
# ./DisableConnectivity.sh "all"

# Clear user data first
./DeleteAppData.sh

# Enable connecitivty
# ./EnableConnectivity.sh $connectivity

# echo "[INFO] Wait for connectivity ready..."
# sleep 5

# Open VPN app
./OpenVPNApp.sh $vpn_app

VPN_READY=false

if [ "$USE_VPN" = true ]
then
    while true; do
        read -p "[INFO] Have you chosen a VPN server(Y/N)? " yn
        case $yn in
            [Yy]* ) VPN_READY=true; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    VPN_READY=true
fi

if [ "$VPN_READY" = true ]
then
    # Open AOW3
    # ./OpenAppAOW3AndDoNothing.sh

    # sleep 60

    # CLose app
    # ./CloseApp.sh

    # Open app again
    ./OpenAppFirstTime.sh $account
fi