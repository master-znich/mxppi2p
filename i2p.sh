#!bin/bash
apt-get install apt-transport-https lua-bit32 prosody  -y
wget -q -O - https://repo.i2pd.xyz/.help/add_repo
apt-get update
echo install i2pd
apt install i2pd
bash -c "cat /tmp/mxppi2p/i2p.conf > /var/lib/i2pd/tunnels.conf "
service i2pd restart
wget -P /usr/lib/prosody/modules https://raw.githubusercontent.com/majestrate/modhttps://tgraph.io/CHerno-treugolnie-04-14_darknet/master/mod_darknet.lua
grep "New private keys file" /var/log/i2pd/i2pd.log |  grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1 |  tee -a  > /tmp/mxppi2p/server.b32.i2p.txt
tee -a /tmp/mxppi2p/prosody.cfg.lua > /etc/prosody/prosody.cfg.lua
read /tmp/mxppi2p/server.b32.i2p.txt << data-file &&
&&  echo "server.b32.i2p.txt = $ser" &&
sed s/xxx.b32.i2p/$ser/g  cat >> /etc/prosody/prosody.cfg.lua |  sed s/xxx.b32.i2p/$ser/g  cat >> /home/test/certs.b32.i2p.sh
bash /home/test/certs.b32.i2p.sh |  bash /tmp/mxppi2p/certs.b32.i2p.sh
service prosody restart
