#!bin/bash
#замінна xxx.b32.i2p на домен нашого сервера
read /tmp/mxppi2p/server.b32.i2p.txt <data-file
sudo echo "server.b32.i2p.txt = $ser"
sudo sed s/xxx.b32.i2p/$ser/g  cat >> /etc/prosody/prosody.cfg.lua
#sleep
sudo sed s/xxx.b32.i2p/$ser/g  cat >> /tmp/mxppi2p/certs.b32.i2p.sh
#sleep
sudo bash /tmp/mxppi2p/certs.b32.i2p.sh
