#!bin/bash


wget -q -O - https://repo.i2pd.xyz/.help/add_repo
apt-get update
echo install i2pd
apt-get update
apt-get install apt-transport-https lua-bit32 prosody i2p -y
bash -c "cat /tmp/mxppi2p/i2p.conf > /var/lib/i2pd/tunnels.conf "
service i2pd restart
wget -P /usr/lib/prosody/modules https://raw.githubusercontent.com/majehttps://www.startpage.com/do/dsearch?query=%D0%BD%D0%B5%D1%82%D1%83+%D0%B0%D0%B4%D1%80%D0%B5%D1%81%D0%B0+%D1%82%D1%83%D0%BD%D0%B5%D0%BB%D1%8F+i2p&cat=web&pl=opensearch&language=englishstrate/mod_darknet/master/mod_darknet.lua
grep "New private keys file" /var/log/i2pd/i2pd.log |  grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1 |  tee -a  > /tmp/mxppi2p/server.b32.i2p.txt
tee -a /tmp/mxppi2p/prosody.cfg.lua > /etc/prosody/prosody.cfg.lua
read /tmp/mxppi2p/server.b32.i2p.txt << data-file &&
&&  echo "server.b32.i2p.txt = $ser" &&
sed s/xxx.b32.i2p/$ser/g  cat >> /etc/prosody/prosody.cfg.lua |  sed s/xxx.b32.i2p/$ser/g  cat >> /home/test/certs.b32.i2p.sh
bash /home/test/certs.b32.i2p.sh |  bash /tmp/mxppi2p/certs.b32.i2p.sh
service prosody restart
