#!/bin/sh


for((i=1;i<=1000;i++));
do 
	echo $i
	./$1 -datadir=run  sendtoaddress ihtQwZBUFHFABbT8fBowhbJh4nMiaMoGfM 10000 ;
done
