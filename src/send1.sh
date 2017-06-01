#!/bin/sh

rm -rf run
rm -rf run1
rm -rf run2

mkdir run
mkdir run1
mkdir run2


touch run/$2.conf
touch run1/$2.conf
touch run2/$2.conf


echo "rpcuser=123" >> run/$2.conf
echo "rpcpassword=123sds" >> run/$2.conf
echo "server=1" >> run/$2.conf
echo "gen=1">>run/$2.conf
echo "daemon=1">>run/$2.conf


echo "daemon=1" >> run1/$2.conf
echo "rpcuser=123" >> run1/$2.conf
echo "rpcpassword=123sds" >> run1/$2.conf
echo "server=1" >> run1/$2.conf
echo "genpos=1">>run1/$2.conf
echo "rpcport=11523">>run1/$2.conf
echo "port=11524">>run1/$2.conf
echo "addnode=127.0.0.1">>run1/$2.conf
echo "banscore=100000">>run1/$2.conf
echo "bantime=10">>run1/$2.conf



echo "daemon=1" >> run2/$2.conf
echo "rpcuser=123" >> run2/$2.conf
echo "rpcpassword=123sds" >> run2/$2.conf
echo "server=1" >> run2/$2.conf
echo "genpos=1">>run2/$2.conf
echo "rpcport=11525">>run2/$2.conf
echo "port=11526">>run2/$2.conf
echo "addnode=127.0.0.1">>run2/$2.conf
echo "banscore=100000">>run2/$2.conf
echo "bantime=10">>run2/$2.conf


./$1 -datadir=run
sleep 5

./$1 -datadir=run1
sleep 5


./$1 -datadir=run2
sleep 5

count=`./$1 -datadir=run  getblockcount`

while(($count < 1000))
do
count=`./$1 -datadir=run   getblockcount`
echo "当前区块个数："$count
done

address=`./$1 -datadir=run1 getnewaddress`

for((i=1;i<=1000;i++));
do 
	echo $i
	./$1 -datadir=run  sendtoaddress $address  1000 ;
done


address=`./$1 -datadir=run2 getnewaddress`

for((i=1;i<=1000;i++));
do 
	echo $i
	./$1 -datadir=run  sendtoaddress $address  1000 ;
done
