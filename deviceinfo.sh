# This script runs a few 'adb shell commands' to extract the information from the device

# check if the script running on linux or on android shell
adb --version > /dev/null 2>&1 && as='adb shell' || as=''
# Graphics Tab
graphics=$($as dumpsys SurfaceFlinger | grep -o "GL_.*" | sed 's/ /\n/g')

# ABI Tab
abi=$($as getprop ro.product.cpu.abilist | sed 's/,/\n/g')

# Features tab
features=$($as pm list features | sed -e 's|feature:||g')

# Libraries Tab
libraries=$($as pm list libraries | sed -e 's|library:||g')

# Build Tab
model=$($as getprop ro.product.model)
manufacturer=$($as getprop ro.product.manufacturer)
brand=$($as getprop ro.product.brand)
product=$($as getprop ro.product.name)
device=$($as getprop ro.product.device)
hardware=$($as getprop ro.hardware)
id=$($as getprop ro.build.id)
bootloader=$($as getprop ro.bootloader)
relase_ver=$($as getprop ro.build.version.release)
build_date=$($as getprop ro.build.date.utc)
fingerprint=$($as getprop ro.build.fingerprint)
sdk_ver=$($as getprop ro.build.version.sdk)

# Userinterface Tab
screen_ensity=$($as getprop ro.sf.lcd_density)
screen_width=$($as wm size)

# Versions Tab
vending_vs=$($as dumpsys package com.android.vending | grep version)
gsf_vs=$($as dumpsys package com.google.android.gsf | grep version)
dl_vs=$($as dumpsys package com.android.providers.downloads | grep version)


# perform and run the commands:
info='
> This info obtains with https://github.com/david-lev/AndroidinfoExtractor/
---------------------------------------------

# BUILD
--------
Model: '$model'
Manufacturer: '$manufacturer'
Brand: '$brand'
Product: '$product'
Device: '$device'
Hardware: '$hardware'
Id: '$id'
Bootloader: '$bootloader'
Relase version: '$relase_ver'
Build data: '$build_date'
Fingerprint: '$fingerprint'
Sdk Version: '$sdk_ver'


# GRAPHICS
----------
'$graphics'


# ABIs
-------
'$abi'


# FEATURES
----------
'$features'


# LIBARIES
----------
'$libraries'


# USERINTERFACE
---------------
Screen ensity:
'$screen_ensity'
Screen width:
'$screen_width'

# VERSIONS
----------
Google play:
'$vending_vs'
Google services freamwork:
'$gsf_vs'
Download manager:
'$dl_vs'
'

# check if to show the output or write it to a file:
[[ $as != "adb shell" ]] && echo "$info" > /sdcard/device_info.txt || echo "$info"
