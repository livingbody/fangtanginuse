# PaddleHub后台服务器进程监控

> 用flask作web发布，PaddleHub模型后端，做了个小网站，然而2G内存捉襟见肘，进程掉的厉害。。。
>
> 只好亲自操刀，做个每15分钟检查一次进程的小程序，如果掉了起起来，并告警到微信，告警用到方糖的服务。

![1](E:\data\7.github\fangtanginuse\img\1.jpg)

![2](E:\data\7.github\fangtanginuse\img\2.jpg)



## 1.配置crontab
```shell script
crontab -e

0,15,30,45 * * * * sh /root/AutoCut/webcron.sh
# *占位  ，分割，，上面表示 每个小时中0分15分30分45分执行一次该命令
```

## 2重启crontab
```shell script
/etc/init.d/cron restart
```

## 3.代码日志
```shell script
(base) root@iZ2ze74yt1daioe0s04o9kZ:~/AutoCutout# crontab -e

Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.basic
  3. /usr/bin/vim.tiny
  4. /bin/ed

Choose 1-4 [1]: 2
No modification made
(base) root@iZ2ze74yt1daioe0s04o9kZ:~/AutoCutout# crontab -e
crontab: installing new crontab
(base) root@iZ2ze74yt1daioe0s04o9kZ:~/AutoCutout# service crond restart
Failed to restart crond.service: Unit crond.service not found.
(base) root@iZ2ze74yt1daioe0s04o9kZ:~/AutoCutout# /etc/init.d/cron restart
[ ok ] Restarting cron (via systemctl): cron.service.
(base) root@iZ2ze74yt1daioe0s04o9kZ:~/AutoCutout# 
```