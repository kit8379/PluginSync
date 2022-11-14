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
			cp -r /var/lib/pterodactyl/volumes/${SERVERUUID[$j]}/plugins/${PLUGIN[$i]} /root/sync/${NAME}/${PLUGIN[$i]}
		fi
		unison /root/sync/${NAME}/${PLUGIN[$i]} /var/lib/pterodactyl/volumes/${SERVERUUID[$j]}/plugins/${PLUGIN[$i]} -auto -batch -repeat watch -prefer newer -fat >/dev/null 2>&1 &
	done
done

