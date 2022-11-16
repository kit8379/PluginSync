#!/bin/bash
echo "Installation process is start!"
sudo apt-get install unison -y
sudo apt-get install cargo -y
sudo cargo install unison-fsmonitor -y
echo "Installation process is ended!"

sudo crontab -l >/tmp/cron
echo '@reboot /root/sync.sh' >>/tmp/cron
sudo crontab /tmp/cron

