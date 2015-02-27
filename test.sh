#!/bin/bash
mkdir test
RAD=10
MAXRAD=30
FRQ=800
ERP=20

while [ $RAD -lt $MAXRAD ]; do
	echo "Calculating $FRQ MHz @ $ERP Watts for $RAD km radius..."
	time ./signalserver -m -d /var/SRTM3 -lat 51.47 -lon -1.50 -txh 15 -gc 2 -rxh 2 -m -dbm -rt -120 -R $RAD -erp $ERP -f $FRQ -o test/$RAD -pm 1 -res 1200 -t
	convert test/$RAD.ppm test/$RAD.png
	rm test/$RAD.ppm
	rm test/$RAD.*cf
	let RAD=RAD+5
done

