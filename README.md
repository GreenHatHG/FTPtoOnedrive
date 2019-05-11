# 实现目标

将ftp内容下载到本地，同步到onedrive

# 步骤

## 下载back.sh

此脚本可以将ftp特定的内容下载到本地。可配合定时任务使用

```shell
crontab -e
#每天早上8点执行脚本
00 08 * * * /bin/sh /home/cc/back.sh
```

## 将ftp内容同步到onedrive

**https://github.com/0oVicero0/OneDrive**

定时任务

```shell
crontab -e
#每天早上8点20执行脚本
20 08 * * * /usr/local/bin/onedrive-d ./ppt
```
