#重启服务器
read -p "是否删除日志文件(y/n)" isdel
if [ "$isdel" = "y" ];
then
cd tomcatdq_8181_new/logs/
rm -f catalina.out
echo "日志删除成功"
else
echo "没有删除日志!"
fi
echo "开始重启tomcat"
#首先查询tomcat的进程编号，然后kill进程
rs=`ps -ef | grep tomcatdq_8181_new | grep -v grep`
#echo "tomcat的进程信息-------"${rs}
#echo ${rs}
tid=`echo ${rs} | cut -d \  -f 2` #默认启动的tomcat的进程id
#tid=`echo "${rs}"|awk -F '' '{print $1}'`
if [ -n "$tid" ];#如果非空，-z为空
then
killcmd=`kill -9 ${tid}`
echo "停止tomcat进程成功"${tid}
else
echo "不需要停止tomcat进程"
fi
cd ../bin
./startup.sh
echo "重启完毕"
exit 0