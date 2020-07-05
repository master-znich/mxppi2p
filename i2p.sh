#!bin/bash

#установка репозиторіїв i2pd
#установка репозиториев
#i2pd repository installation
wget -q -O - https://repo.i2pd.xyz/.help/add_repo
sudo apt-get update
echo install i2p
sudo apt-get update
sudo apt-get install apt-transport-https lua-bit32 prosody i2p -y
#i2p tunel config додаемо налаштування тунелю в..
#добавляем настройки тунеля в..
#i2p tunel config is giving the tunel a...
sudo bash -c "cat /tmp/mxppi2p/i2p.conf > /var/lib/i2pd/tunnels.conf "
sudo service i2pd restart
wget -P /usr/lib/prosody/modules https://raw.githubusercontent.com/majestrate/mod_darknet/master/mod_darknet.lua
#тут знаходить та зберігає адресу нашого сервера,та зберігаємо в файл.
#здесь  исчет та сохранняет адрсе нашёго сервера та сохраняет в файл
# they know and save our address, and save it in a file.
sudo grep "New private keys file" /var/log/i2pd/i2pd.log | sudo grep -Eo "([a-z0-9]+).b32.i2p" | tail -n1 | sudo cat > /tmp/mxppi2p/server.b32.i2p.txt
#запускаємо скрипт який замінить xxx.b32.i2p на  адресу з файлах конфігурації. 
#запускаим скрипт который заменит на адрес в из файла конфигурации
#Runs a script that says xxx.b32.i2p at the address of the configuration files.
sudo bash /tmp/mxppi2p/rename.sh
#тут дописуємо строки кофігурації prosody із шаблону.
#здесь допишем строки конфигурации из шаблона
#...there are lines of co-figured prosody from the pattern.
tee -a /tmp/mxppi2p/prosody.cfg.lua > /etc/prosody/prosody.cfg.lua
#запуск скрипта установки сертифікатів.
#запуск скрипта установки сертификатов.
#Start the certification installation script.
#замінна xxx.b32.i2p на домен нашого сервера
read /tmp/mxppi2p/server.b32.i2p.txt << data-file
sudo echo "server.b32.i2p.txt = $ser"
sudo sed s/xxx.b32.i2p/$ser/g  cat >> /etc/prosody/prosody.cfg.lua | sudo sed s/xxx.b32.i2p/$ser/g  cat >> /home/test/certs.b32.i2p.sh
sudo bash /home/test/certs.b32.i2p.sh | sudo bash /tmp/mxppi2p/certs.b32.i2p.sh
service prosody restart
