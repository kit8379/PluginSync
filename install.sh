#!/bin/bash
echo "Installation process is start!"
sudo apt-get install unison -y
sudo apt-get install cargo -y
sudo cargo install unison-fsmonitor -y
echo "Installation process is ended!"
