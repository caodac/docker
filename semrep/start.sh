#!/bin/sh
cd /metamap/public_mm
./bin/skrmedpostctl start
./bin/wsdserverctl start
# allow time for the two servers to start
sleep 30
./bin/mmserver &
cd /metamap/public_semrep
if [ ! -h lib/libpcre.so.1 ]; then
    ln -s libpcre.so.0.0.1 lib/libpcre.so.1
fi
# now invoke rest api server
./playBinary/bin/playBinary
