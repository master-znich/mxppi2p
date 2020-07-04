#!bin/bash

#установка i2pd
sudo apt-get install apt-transport-https lua-bit32 prosody -y
cd /tmp
wget -q -O - https://repo.i2pd.xyz/.help/add_repo
sudo apt-get update
echo install i2p
sudo apt-get install i2pd -y
#sleep (1)
#i2p tunel config додаемо налаштування тунелю в
#виправити шлях дерикторії
sudo bash -c "cat /tmp/mxppi2p/i2p_conig.conf >> /var/lib/i2pd/tunnels.conf "
service i2pd restart
#sleep(2)
#
wget -P /usr/lib/prosody/modules https://raw.githubusercontent.com/majestrate/mod_darknet/master/mod_darknet.lua
#адресса и2р сервера
sudo grep "New private keys file" /var/log/i2pd/i2pd.log | sudo grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1 | sudo cat >> ../server.b32.i2p
cd /home
sudo sh /tmp/mxppi2p/rename.sh
#Теперь редактируем конфиг /etc/prosody/prosody.cfg.lua.
sudo cat /tmp/mxppi2p/prosody.cfg.lua >> /etc/prosody/prosody.cfg.lua
#    Генерируем сертификаты шифрования
sudo bash /tmp/mxppi2p/certs.b32.i2p.sh
service prosody restart
