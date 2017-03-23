@echo off
Chcp 65001
::test.bat 192.168.0.252 root zhiziyun0628 dmp D:\DBback
::数据库IP 连接用户 密码 备份数据库 备份位置
echo %1 %2 %3 %4 %5 
if "%5" == "" pause 
cd C:\Program Files\MySQL\MySQL Server 5.5\bin
set ip=%1

set user=%2

set pwd=%3

set database=%4

set path=%5

set h=%time:~0,2%
set h=%h: =0%
set bakFileNameTail=%date:~3,4%-%date:~8,2%-%date:~11,2%_%h%%time:~3,2%%time:~6,2%
echo "-u%user% -p%pwd% -h%ip% -P3306 %database% > %path%/%database%_%bakFileNameTail%.sql"
echo --------------开始备份%database% %ip%--------------
mysqldump -u%user% -p%pwd% -h%ip% -P3306 %database% > %path%/%database%_%bakFileNameTail%.sql
echo 备份%database%结束 备份文件:%database%_%bakFileNameTail%.sql