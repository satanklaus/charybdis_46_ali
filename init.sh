#!/bin/bash

cd $HOME/src

git clone https://github.com/zmkfirmware/zmk.git
git clone https://github.com/DoctorWangWang/zmk-pmw3610-driver
git clone https://github.com/satanklaus/charybdis_46_ali

cd zmk
python -m ~/venvs/zmk
. ~/venvs/zmk/bin/activate
pip install west
west init -l app/
west update
west zephyr-export
pip install -r zephyr/scripts/requirements-base.txt
