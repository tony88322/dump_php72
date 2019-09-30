#!/bin/sh

echo
echo "============================================"
echo "中国时间"
echo "============================================"
echo

apk add -U tzdata
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
apk del tzdata