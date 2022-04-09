#!/bin/bash

# Critical apps 
cri_apps_arr=(  com.geargames.aow                 # art of war 3 game
                com.android.vending               # google play service
                com.google.android.play.games     # google play game
                com.google.android.gms            # google play store
                )
# VPN apps
vpn_apps_arr=(  co.solovpn                        # solo vpn app
                com.easyovpn.easyovpn             # easy vpn app
                net.openvpn.openvpn               # open vpn app
                )

# Other apps
oth_apps_arr=(  com.ss.android.ugc.trill          # tiktok
                com.razer.cortex                  # cortex game
                com.ncsoft.universeapp            # universe
                com.playrix.township              # township
                com.allstarunion.ta.jp            # ant game
                link.merge.puzzle.onnect.number   # tile connect game
                com.tilemaster.puzzle.block.match # tile master game
                com.leftover.CoinDozer            # coin dozer game
                com.king.candycrushsaga           # candy crush saga game
                com.jobkorea.gamejob              # job korea gamejob
                tv.pluto.android                  # pluto tv app
                com.luckyday.app                  # lucky day app
                com.tubitv                        # tubi tv app
                connectiq.miles.app               # miles app
                com.gosub60.sol5                  # solitaire app
                com.joinroot.root                 # root app
                com.clearchannel.iheartradio.controller # i heart rate radio app
                com.game.boy68                    # boy68 game
                com.moneylion                     # moneylion app
                )

# Uninstall apps
uni_apps_arr=(  com.ss.android.ugc.trill          # tiktok
                com.razer.cortex                  # cortex game
                )
echo "[INFO] Clear critical apps..."
for index in "${cri_apps_arr[@]}" 
do
  echo "Clear storage of $index..."
  adb -s $ADB_DEVICE_NAME shell pm clear $index
  sleep 0.2
done

echo "[INFO] Clear vpn apps..."
for index in "${vpn_apps_arr[@]}" 
do
  echo "Clear storage of $index..."
  adb -s $ADB_DEVICE_NAME shell pm clear $index
  sleep 0.2
done

echo "[INFO] Clear other apps..."
for index in "${oth_apps_arr[@]}" 
do
  echo "Clear storage of $index..."
  adb -s $ADB_DEVICE_NAME shell pm clear $index
  sleep 0.2
done

echo "[INFO] Uninstall some apps..."
for index in "${uni_apps_arr[@]}" 
do
  echo "Uninstall $index..."
  adb -s $ADB_DEVICE_NAME shell pm uninstall -k --user 0 uninstall $index
  sleep 0.2
done
