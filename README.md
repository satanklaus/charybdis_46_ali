My config for Charybdis 4x6 bougth on[Aliexpress](https://aliexpress.ru/item/1005008363930259.html)

## Local Build:

### setup
```
git clone https://github.com/zmkfirmware/zmk.git
git clone https://github.com/DoctorWangWang/zmk-pmw3610-driver
git clone https://github.com/satanklaus/charybdis_46_ali

cd zmk
python -m ~/venvs/zmk-venv
pip install west
west init -l app/
west update
west zephyr-export
pip install -r zephyr/scripts/requirements-base.txt
```

### build
```
west build -p -b nice_nano_v2 -- -d build/left -DSHIELD=charybdis_left -DZMK_CONFIG=/home/saiba/src/charybdis_46_ali/config -DZMK_EXTRA_MODULES="/home/saiba/src/zmk-pmw3610-driver/"
west build -p -b nice_nano_v2 -- -d build/right -DSHIELD=charybdis_right -DZMK_CONFIG=/home/saiba/src/charybdis_46_ali/config -DZMK_EXTRA_MODULES="/home/saiba/src/zmk-pmw3610-driver/"
west build -p -b nice_nano_v2 -- -d build/reset -DSHIELD=settings_reset -DZMK_CONFIG=/home/saiba/src/charybdis_46_ali/config -DZMK_EXTRA_MODULES="/home/saiba/src/zmk-pmw3610-driver/"
```

