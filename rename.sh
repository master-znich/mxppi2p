#!bin/bash
#замінна xxx.b32.i2p на домен нашого сервера
read /home/test/server.b32.i2p <data-file
sudo echo "server.b32.i2p = $ser"
sudo sed s/xxx.b32.i2p/$ser/g  cat >> /etc/prosody/prosody.cfg.lua
#sleep
sudo sed s/xxx.b32.i2p/$ser/g  cat >> /home/test/certs.b32.i2p.sh
#sleep
sudo bash /home/test/certs.b32.i2p.sh
