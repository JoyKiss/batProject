@echo off 
Chcp 65001
echo 输入"1"退出
:begin
cd C:\Program Files\MySQL\MySQL Server 5.5\bin
echo 请输入备份数据库IP:
set /p ip= 
if "%ip%"=="1" exit &

echo 请输入备份连接用户:
set /p user= 
if "%user%"=="1" exit &

echo 请输入备份连接用户密码:
set /p pwd= 
if "%pwd%"=="1" exit &

echo 请输入备份数据库:
set /p database= 
if "%database%"=="1" exit &

echo 请输入备份位置(默认E:):
set /p path= 
if "%path%"=="1" exit &
if "%path%"=="" set path = "E:"

set h=%time:~0,2%
set h=%h: =0%
set bakFileNameTail=%date:~0,4%-%date:~5,2%-%date:~8,2%_%h%%time:~3,2%%time:~6,2%
echo --------------开始备份%database% %ip%--------------
mysqldump -u%user% -p%pwd% -h%ip% -P3306 %database% > %path%/%database%_%bakFileNameTail%.sql
echo 备份%database%结束 备份文件:%database%_%bakFileNameTail%.sql
goto begin