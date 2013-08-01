#!/bin/bash
for x in ../FOF/SYN*.p 
do 
    echo -n "proving"; echo $x;
    cp $x test.p;
    if ./limit.py ./zenon -q -p0 -odedukti -itptp test.p > test.dk; 
    then 
	if ./limit.py camelide -v 0 test.dk
	then echo "OK";
	else echo "dedukti fail";
	fi
    else echo "zenon fail";
    fi
done 
