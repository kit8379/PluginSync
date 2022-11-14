#!/bin/bash
NAME="survival"
PLUGIN=("" "" "")
SERVERUUID=("" "" "")


PLENGTH=${#PLUGIN[*]}
SLENGTH=${#SERVERUUID[*]}


for ((i=0; i<${PLENGTH}; i++))
do
	for ((j=0; j<${SLENGTH}; j++))
	do
		echo "${SERVERUUID[$j]} ${PLUGIN[$i]}"
		if [ ! -d "/root/sync/${NAME}/${PLUGIN[$i]}" ] 
		then
			sudo mkdir -p /root/sync/${NAME}/${PLUGIN[$i]}
		fi
		if [ ! -d "/var/lib/pterodactyl/volumes/${SERVERUUID[$j]}/plugins/${PLUGIN[$i]}" ] 
		then
			sudo mkdir -p /var/lib/pterodactyl/volumes/${SERVERUUID[$j]}/plugins/${PLUGIN[$i]}
		fi
		unison /var/lib/pterodactyl/volumes/${SERVERUUID[$j]}/plugins/${PLUGIN[$i]} /root/sync/${NAME}/${PLUGIN[$i]} -auto -batch -repeat watch -prefer newer -fat >/dev/null 2>&1 &
	done
done

