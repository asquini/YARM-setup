YARM RIOT toolchain setup for a UBUNTU 16.04 LTS fresh install

(from home)
sudo apt-get install lib32z1 libncurses5
sudo apt-get install libtool
sudo apt-get install automake
sudo apt-get install libusb-1.0
sudo apt-get install texinfo
sudo apt-get install libudev-dev
sudo apt-get install avrdude

git clone https://github.com/asquini/YARM-setup.git

git clone https://github.com/signal11/hidapi.git
cd hidapi/
./bootstrap
./configure
make
sudo make install
nano ~/.profile
      At the bottom of .profile, add the following line.

PATH="$HOME/bin:/usr/local/lib:$PATH"

      To save the file, press Ctrl+X then Press Y and finally to accept and exit the editor press Enter.
      In order to reload the system PATH variable, you will need to logout and back in of your user account. 
echo $PATH
	  you should see the updated PATH

sudo ldconfig
cd ~/

git clone git://git.code.sf.net/p/openocd/code openocd
cd openocd
./bootstrap
./configure --enable-cmsis-dap --enable-jlink
make 
sudo make install

git clone https://github.com/ant9000/edbg 
cd edbg 
make 
sudo cp edbg /usr/local/bin
cd ..

mkdir RIOT
cd RIOT


sudo cp ../YARM-setup/99-atmel-ice.rules /etc/udev/rules.d/
sudo udevadm control --reload


sudo addgroup $USER dialout
      In order to finalise the addgroup command, you will need to logout and back in of your user account. 


cp ../YARM-setup/arm_toolchain.sh .
cp ../YARM-setup/test_RIOT_yarm .

chmod +x test_RIOT_yarm.sh

      to install the toolchain and RIOT sources and then program the example default RIOT application:
./test_RIOT_yarm.sh           

-----------------------------------------------------------------


      to program the ata8510 EEPROM  ( switch the YARM ice adapter on AVR ! )
cp ../YARM-setup/firmware_S2_C0_9600.hex ./RIOT/drivers/ata8510/firmware/
cd RIOT/drivers/ata8510/firmware
./flash.sh firmware_S2_C0_9600.hex



to program a continuous transmitter (a few messages per second)
(from $HOME/RIOT)
. arm_toolchain.sh
cd RIOT/tests/driver_ata8510
BOARD=yarm TX=1 make flash
BOARD=yarm make term

to program a continuous receiver
(from $HOME/RIOT)
. arm_toolchain.sh
cd RIOT/tests/driver_ata8510
BOARD=yarm RX=1 make flash
BOARD=yarm make term


