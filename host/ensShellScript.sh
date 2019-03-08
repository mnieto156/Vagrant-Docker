#!/bin/bash
./ens2001 $1.ens > $1.out < $1.in
if grep -q "ERROR" $1.out 
then
	echo "error en la emulación por ens2001"
	grep -na "ERROR" $1.out
	exit 64
else
	checklines=$(wc -l < $1.check);
	foundlines=$(grep -of $1.check $1.out | sort --unique | wc -l);
	#echo $checklines
	#echo $foundlines
	if (( $foundlines==$checklines ))
	then
		echo "Ejecución correcta"
		#cat $1.out
	else
		echo "Ejecución incompleta"
		exit 65
	fi
	#echo "done"
fi