#!/bin/sh
./ens2001 $1.ens > $1.out < $1.in
if grep -q "ERROR" $1.out 
then
	echo "error en la emulación por ens2001"
	exit 64
else
	echo "done"
fi