#!/bin/bash

#comment out to disable
logging=" -S zmk-usb-logging"
builddir=$PWD
mkdir $PWD/artifacts &>/dev/null

source ~/venvs/zmk2/bin/activate

cd ~/src/zmk/app

targets=(charybdis_left charybdis_right settings_reset)

for target in ${targets[*]}; do 
	echo $target; 
	mkdir -p ./build/$target &>/dev/null
	west build -b nice_nano_v2 -d build/$target ${logging:-""} -- -DSHIELD=$target -DZMK_CONFIG=$HOME/src/charybdis_46_ali/config -DZMK_EXTRA_MODULES="$HOME/src/zmk-pmw3610-driver/;$HOME/src/zmk-input-processor-keybind"
	echo 	BUILD STATUS: $?
	cp ./build/$target/zephyr/zmk.uf2 $builddir/artifacts/$target.uf2
done

