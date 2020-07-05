#!bin/bash

#установка репозиторіїв i2pd
#i2pd repository installation
wget -q -O - https://repo.i2pd.xyz/.help/add_repo
sudo apt-get update
echo install i2p
sudo apt-get update
sudo apt-get install apt-transport-https lua-bit32 prosody i2p -y
#i2p tunel config додаемо налаштування тунелю в..
#i2p tunel config is giving the tunel a...
sudo bash -c "cat /tmp/mxppi2p/i2p.conf > /var/lib/i2pd/tunnels.conf "
sudo service i2pd restart
sudo "wget -P /usr/lib/prosody/modules https://raw.githubusercontent.com/majestrate/mod_darknet/master/mod_darknet.lua"
#тут знаходить та зберігає адресу нашого,та зберігаємо в файл.
# they know and save our address, and save it in a file.
sudo grep "New private keys file" /var/log/i2pd/i2pd.log | sudo grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1 | sudo cat > /tmp/mxppi2p/server.b32.i2p.txt
#запускаємо скрипт який замінить xxx.b32.i2p на  адресу  файлах конфігурації.
#Runs a script that says xxx.b32.i2p at the address of the configuration files.
sudo sh /tmp/mxppi2p/rename.sh
#тут дописуємо строки кофігурації prosody із шаблону.
#...there are lines of co-figured prosody from the pattern.
sudo "cat /tmp/mxppi2p/prosody.cfg.lua > /etc/prosody/prosody.cfg.lua"
#запуск скрипта установки сертифікатів.
#Start the certification installation script.
sudo bash /tmp/mxppi2p/certs.b32.i2p.sh
service prosody restart
