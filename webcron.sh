#!/bin/sh
#切换到目录
cd /root/AutoCutout
conda activate paddle
t='date'
#查询flask应用端口占用
lsof -i:80
# $? -ne 0 不存在 $? -eq 0存在
if [ $? -ne 0 ]; then
  python app.py >>app_out.txt &
  python fangtangtest.py
  echo $t ":************flask应用 restart.***************" >>daemonX.log
else
  echo $t ":flask应用 is normal." >>daemonX.log
fi
##################################################################
#查询paddlehub serving端口占用
lsof -i:8866
# $? -ne 0 不存在 $? -eq 0存在
if [ $? -ne 0 ]; then
  hub serving start --config cpuconfig.json >>paddlehub_out.txt &
  python fangtangtest.py
  echo $t ":************paddlehub serving restart.***************" >>daemonX.log
else
  echo $t ":paddlehub serving is normal." >>daemonX.log
fi
