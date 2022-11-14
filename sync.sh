#!/bin/bash
NAME="survival"
PLUGIN=("MMOItems" "MythicMobs") 
SERVERUUID=("0699421b-cc90-40d5-3253-f8b9ca7238ab" "329421b-cc90-40d5-3253-f8b9cb4738ab")


PLENGTH=${#PLUGIN[*]}
SLENGTH=${#SERVERUUID[*]}


for ((i=0; i<${PLENGTH}; i++))
do
	for ((j=0; j<${SLENGTH}; j++))
	do
		echo "${SERVERUUID[$j]} ${PLUGIN[$i]}"
		if [ ! -d "/root/sync/${NAME}/${PLUGIN[$i]}" ] 
		then
			cp -r /var/lib/pterodactyl/volumes/${SERVERUUID[$j]}/plugins/${PLUGIN[$i]} /root/sync/${NAME}/${PLUGIN[$i]}
		fi
		unison /var/lib/pterodactyl/volumes/${SERVERUUID[$j]}/plugins/${PLUGIN[$i]} /root/sync/${NAME}/${PLUGIN[$i]} -auto -batch -repeat watch -prefer newer -fat >/dev/null 2>&1 &
	done
done
