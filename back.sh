#! /bin/sh
echo "Script start at $(date)" #显示脚本开始执行的时间
HOST=10.5.1.5 #ftp服务器地址
USER=('we' 'wang' 'robert' 'liuaimin' 'wangfang') #用户名
PASS=('345678' 'wang' 'robert' '123456' 'wangfang') #密码
start='Starting to' #提示性输出语句
user_len=${#USER[*]}  #获取USER数组的长度

#下载ftp特定文件夹的内容到本地文件夹,断点续传+10多线程下载
#默认ftp下载路径:./下载/* 默认存放路径:./用户名/ppt/*
downLoad() 
{
    lftp -u $1,$2 ftp://${HOST}<<EOF
    mirror --parallel=10 -c ./下载/"$3" $1/ppt/"$4" 
    exit
EOF
    echo "done"
}

i=0
while(( $i < ${user_len} ))
do
    user=${USER[$i]}
    echo "${start} ${user}"
       
    if [ ${user} = 'we' ] #判断当前用户
    then
        downLoad ${user} ${PASS[i]} 算法设计与分析 算法设计与分析 #用户名 密码 要下载文件夹 存放的路径
    #    downLoad ${user} ${PASS[i]} 比赛用机编译环境 比赛用机编译环境

    elif [ ${user} = 'wang' ]
    then
        downLoad ${user} ${PASS[i]} 软件工程导论 软件工程导论
       
    elif [ ${user} = 'liuaimin' ]
    then
        downLoad ${user} ${PASS[i]} C#程序设计 C#程序设计

    elif [ ${user} = 'robert' ]
    then
        downLoad ${user} ${PASS[i]} 计算机网络 计算机网络

    elif [ ${user} = 'wangfang' ]
    then
        downLoad ${user} ${PASS[i]} 'Java EE框架应用开发' 'Java EE框架应用开发'

    fi
    let "i++"
done
echo "Script end at $(date)" #显示脚本结束执行的时间
