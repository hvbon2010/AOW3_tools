#!/bin/sh

echo "===Auto get Gifts for AOW3==="

READY=false

while true; do
    read -p "[INFO] Did you open Nox Player(Y/N)? " yn
    case $yn in
        [Yy]* ) READY=true; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

while true; do
    read -p "[INFO] Is account ready for AOW3(Y/N)? " yn
    case $yn in
        [Yy]* ) READY=true; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

if [ "$READY" = true ]
then
    while true; do
        current_time=$(date +%s)
        if [ $((current_time-prev_time)) -gt 1800 ]
        then
            echo "======$(date +'%m-%d %T.%3N')====="
            
            prev_time=$current_time
            
            # open app aow3 (don't firt time)
            ./OpenAppAOW3.sh

            # get Free Box
            ./GetFreeBox.sh

            # get Special Box
            ./GetSpecialBox.sh

            ./CloseApp.sh
        fi
        sleep 60
    done
fi

