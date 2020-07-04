#!/bin/bash
sudo openssl genrsa -out /etc/prosody/certs/xxx.b32.i2p.key 2048
sudo openssl req -new -x509 -key /etc/prosody/certs/xxx.b32.i2p.key -out /etc/prosody/certs/xxx.b32.i2p.crt -days 3650
sudo chown root:prosody /etc/prosody/certs/*.b32.i2p.{key,crt}
sudo chmod 640 /etc/prosody/certs/*.b32.i2p.{key,crt}
sudo prosodyctl adduser admin@xxx.b32.i2p
