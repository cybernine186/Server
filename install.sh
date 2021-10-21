#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

echo "#########################################################                         "
echo "#::: EverQuest Emulator Modular Installer                                         "
echo "#::: Installer Author: Akkadius                                                   "
echo "#::: Installer Co-Author(s): N0ctrnl                                              "
echo "#:::                                                                              "
echo "#::: EQEmulator Server Software is developed and maintained                       "
echo "#:::	by the EQEmulator Developement team                                         "
echo "#:::                                                                              "
echo "#::: Everquest is a registered trademark                                          "
echo "#::: Daybreak Game Company LLC.                                                   "
echo "#:::                                                                              "
echo "#::: EQEmulator is not associated or                                              "
echo "#::: affiliated in any way with Daybreak Game Company LLC.                        "
echo "#########################################################                         "
echo "#:                                                                                "
echo "#########################################################                         "
echo "#::: To be installed:                                                             "
echo "#########################################################                         "
echo "- Server running folder - Will be installed to the folder you ran this script     "
echo "- MariaDB (MySQL) - Database engine                                               "
echo "- Perl 5.X :: Scripting language for quest engines                             "
echo "- LUA Configured :: Scripting language for quest engines                          "
echo "- Latest PEQ Database                                                             "
echo "- Latest PEQ Quests                                                               "
echo "- Latest Plugins repository                                                       "
echo "- Maps (Latest V2) formats are loaded                                             "
echo "- New Path files are loaded                                                       "
echo "- Optimized server binaries                                                       "
echo "#########################################################                         "

# Installation variables (Don't need to change, only for advanced users)

export eqemu_server_directory=/home/eqemu
export apt_options="-y -qq" # Set autoconfirm and silent install

################################################################

if [ ! -f ./install_variables.txt ]; then

	read -n1 -r -p "Press any key to continue..." key
	
	#::: Setting up user environment (eqemu)
	echo "First, we need to set your passwords..."
	echo "Make sure that you remember these and keep them somewhere"
	echo ""
	echo ""
	groupadd eqemu
	useradd -g eqemu -d $eqemu_server_directory eqemu
	passwd eqemu

	#::: Make server directory and go to it
	mkdir $eqemu_server_directory
	cd $eqemu_server_directory

	#::: Setup MySQL root user PW
	read -p "Enter MySQL root (Database) password: " eqemu_db_root_password

	#::: Write install variables (later use)
	echo "mysql_root:$eqemu_db_root_password" > install_variables.txt

	#::: Setup MySQL server 
	read -p "Enter Database Name (single word, no special characters, lower case):" eqemu_db_name
	read -p "Enter (Database) MySQL EQEmu Server username: " eqemu_db_username
	read -p "Enter (Database) MySQL EQEmu Server password: " eqemu_db_password

	#::: Write install variables (later use)
	echo "mysql_eqemu_db_name:$eqemu_db_name" >> install_variables.txt
	echo "mysql_eqemu_user:$eqemu_db_username" >> install_variables.txt
	echo "mysql_eqemu_password:$eqemu_db_password" >> install_variables.txt
fi


# Install pre-req packages
apt-get -y update
apt-get $apt_options install bash
apt-get $apt_options install build-essential
apt-get $apt_options install cmake
apt-get $apt_options install cpp
apt-get $apt_options install curl
apt-get $apt_options install debconf-utils
apt-get $apt_options install g++
apt-get $apt_options install gcc
apt-get $apt_options install git
apt-get $apt_options install git-core
apt-get $apt_options install libio-stringy-perl
apt-get $apt_options install liblua5.1
apt-get $apt_options install liblua5.1-dev
apt-get $apt_options install libluabind-dev
apt-get $apt_options install libmysql++
apt-get $apt_options install libperl-dev
apt-get $apt_options install libperl5i-perl
apt-get $apt_options install libwtdbomysql-dev
apt-get $apt_options install libmysqlclient-dev
apt-get $apt_options install minizip
apt-get $apt_options install lua5.1
apt-get $apt_options install make
apt-get $apt_options install mariadb-client
apt-get $apt_options install open-vm-tools
apt-get $apt_options install unzip
apt-get $apt_options install uuid-dev
apt-get $apt_options install wget
apt-get $apt_options install zlib-bin
apt-get $apt_options install zlibc
apt-get $apt_options install libsodium-dev
apt-get $apt_options install libsodium18
apt-get $apt_options install libjson-perl
apt-get $apt_options install libssl-dev
apt-get $apt_options install apache2
apt-get $apt_options install php
apt-get $apt_options install php-mbstring
apt-get $apt_options install php-gettext
apt-get $apt_options install phpmyadmin

# PHPMyAdmin Install
phpenmod mbstring
ln -s -f /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
a2enconf phpmyadmin
systemctl restart apache2

# Install libsodium
wget http://ftp.us.debian.org/debian/pool/main/libs/libsodium/libsodium-dev_1.0.11-2_amd64.deb -O /home/eqemu/libsodium-dev.deb
	wget http://ftp.us.debian.org/debian/pool/main/libs/libsodium/libsodium18_1.0.11-2_amd64.deb -O /home/eqemu/libsodium18.deb

dpkg -i /home/eqemu/libsodium*.deb
# Cleanup after ourselves
rm -f /home/eqemu/libsodium-dev.deb
rm -f /home/eqemu/libsodium18.deb

#::: Install MariaDB Server
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password PASS'
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password PASS'
apt-get install -y mariadb-server
mysql -uroot -pPASS -e "SET PASSWORD = PASSWORD('$eqemu_db_root_password');"

# Start MariaDB server and set root password
echo "Starting MariaDB server..."
systemctl enable mariadb.service --now
sleep 5
/usr/bin/mysqladmin -u root password $eqemu_db_root_password

#::: Configure game server database user
mysql -uroot -p$eqemu_db_root_password -e "CREATE USER '$eqemu_db_username'@'localhost' IDENTIFIED BY '$eqemu_db_password';"
mysql -uroot -p$eqemu_db_root_password -e "GRANT GRANT OPTION ON *.* TO '$eqemu_db_username'@'localhost';"
mysql -uroot -p$eqemu_db_root_password -e "GRANT ALL ON *.* TO '$eqemu_db_username'@'localhost';"

#::: Create source and server directories
mkdir $eqemu_server_directory/server
mkdir $eqemu_server_directory/server_build
mkdir $eqemu_server_directory/server_source

#::: Back to server directory
git clone --recurse-submodules https://github.com/cybernine186/Server.git $eqemu_server_directory/server
git clone --recurse-submodules https://github.com/cybernine186/Code.git $eqemu_server_directory/server_source
git clone --recurse-submodules https://github.com/cybernine186/EQEmuMaps.git $eqemu_server_directory/server/maps
git clone --recurse-submodules https://github.com/cybernine186/quests.git $eqemu_server_directory/server/quests
git clone --recurse-submodules https://github.com/cybernine186/peqphpeditor.git $eqemu_server_directory/peqeditor
git clone --recurse-submodules https://github.com/cybernine186/Client.git $eqemu_server_directory/client
git clone --recurse-submodules https://github.com/cybernine186/EQEmuAllakhazamClone.git $eqemu_server_directory/eqemuallakhazamclone

#::: PEQEditor
ln -s -f $eqemu_server_directory/peqeditor/apache2/peqeditor.conf /etc/apache2/conf-available/peqeditor.conf
a2enconf peqeditor
systemctl restart apache2

#::: EQEmuAllakhazamClone
ln -s -f /home/eqemu/eqemuallakhazamclone/apache2/eqemuallakhazamclone.conf /etc/apache2/conf-available/eqemuallakhazamclone.conf
a2enconf eqemuallakhazamclone
systemctl restart apache2

#::: Client
ln -s -f $eqemu_server_directory/client/apache2/eqemupatcher_00.conf /etc/apache2/conf-available/eqemupatcher_00.conf
ln -s -f $eqemu_server_directory/client/apache2/eqemupatcher_01.conf /etc/apache2/conf-available/eqemupatcher_01.conf
ln -s -f $eqemu_server_directory/client/apache2/eqemupatcher_02.conf /etc/apache2/conf-available/eqemupatcher_02.conf
a2enconf eqemupatcher_00.conf
systemctl restart apache2

#::: Build Server
cd $eqemu_server_directory/server_build
cmake $cmake_options -DEQEMU_BUILD_LOGIN=ON -DEQEMU_BUILD_LUA=ON -G "Unix Makefiles" $eqemu_server_directory/server_source
make -j 12

#::: Link Server Executables
ln -s -f $eqemu_server_directory/server/maps $eqemu_server_directory/server/Maps
ln -s -f $eqemu_server_directory/server_build/bin/eqlaunch $eqemu_server_directory/server/eqlaunch
ln -s -f $eqemu_server_directory/server_build/bin/export_client_files $eqemu_server_directory/server/export_client_files
ln -s -f $eqemu_server_directory/server_build/bin/import_client_files $eqemu_server_directory/server/import_client_files
ln -s -f $eqemu_server_directory/server_build/bin/libcommon.a $eqemu_server_directory/server/libcommon.a
ln -s -f $eqemu_server_directory/server_build/bin/libluabind.a $eqemu_server_directory/server/libluabind.a
ln -s -f $eqemu_server_directory/server_build/bin/queryserv $eqemu_server_directory/server/queryserv
ln -s -f $eqemu_server_directory/server_build/bin/shared_memory $eqemu_server_directory/server/shared_memory
ln -s -f $eqemu_server_directory/server_build/bin/ucs $eqemu_server_directory/server/ucs
ln -s -f $eqemu_server_directory/server_build/bin/world $eqemu_server_directory/server/world
ln -s -f $eqemu_server_directory/server_build/bin/zone $eqemu_server_directory/server/zone
ln -s -f $eqemu_server_directory/server_build/bin/loginserver $eqemu_server_directory/server/loginserver

#::: Chown files
chown eqemu:eqemu $eqemu_server_directory/ -R 
chmod 755 $eqemu_server_directory/server/*.pl
chmod 755 $eqemu_server_directory/server/*.sh