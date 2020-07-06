#!bin/bash
sudo apt-get install apt-transport-https lua-bit32 prosody  -y
wget -q -O - https://repo.i2pd.xyz/.help/add_repo
sudo apt-get update
echo install i2pd
sudo bash -c "cat /tmp/mxppi2p/i2p.conf > /var/lib/i2pd/tunnels.conf "
sudo service i2pd restart
wget -P /usr/lib/prosody/modules https://raw.githubusercontent.com/majestrate/mod_darknet/master/mod_darknet.lua
sudo grep "New private keys file" /var/log/i2pd/i2pd.log | sudo grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1 | sudo tee -a  > /tmp/mxppi2p/server.b32.i2p.txt
tee -a /tmp/mxppi2p/prosody.cfg.lua > /etc/prosody/prosody.cfg.lua
read /tmp/mxppi2p/server.b32.i2p.txt << data-file &&
&& sudo echo "server.b32.i2p.txt = $ser" &&
sudo sed s/xxx.b32.i2p/$ser/g  cat >> /etc/prosody/prosody.cfg.lua | sudo sed s/xxx.b32.i2p/$ser/g  cat >> /home/test/certs.b32.i2p.sh
sudo bash /home/test/certs.b32.i2p.sh | sudo bash /tmp/mxppi2p/certs.b32.i2p.sh
service prosody restart
