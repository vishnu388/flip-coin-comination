#!/bin/bash -x

flipcoin=$(($RANDOM%2))

if [ $flipcoin -eq 1 ]
then
   echo HEAD
else
   echo Tails
fi
