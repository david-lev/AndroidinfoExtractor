# AndroidinfoExtractor

A shell script that obtains information from any android device to help create fakes devices.
The extracted information contains the following details:
Build informations, features, libaries, abi's, graphics, userinterface, versions and more.

# How to use?
### With Linux or macOS:
- Download the [deviceinfo.sh](/deviceinfo.sh) file to computer.
- You need to have adb in your path. Installation instructions can be found [here](https://www.xda-developers.com/install-adb-windows-macos-linux/).
- Once ADB is properly installed and an Android device is connected and recognized (try running `adb devices`), you can run the script And the information will be printed on the terminal.

### On Android shell:
- Download the [deviceinfo.sh](/deviceinfo.sh) file to android phone.
- Install Termux / Terminal emulator or simply use `adb shell` and move the script to `/data/local/tmp/` directory.
- Allow executable permissions with `chmod +x deviceinfo.sh` and then run the script with `sh deviceinfo.sh`. 
- A new file will be created in the internal storage and will be named `device_info.txt`.
