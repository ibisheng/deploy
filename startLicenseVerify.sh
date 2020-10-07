#!/usr/bin/env bash

PROC_NAME=licenseVerify
ProcNumber=`ps -ef |grep -w $PROC_NAME|grep -v grep|wc -l`
if [ $ProcNumber -le 0 ];then
   echo "licenseVerify is not run"
   nohup ./licenseVerify &> /dev/null &
else
   echo "licenseVerify is  running.."
   bash stopLicenseVerify.sh
   nohup ./licenseVerify &> /dev/null &
fi