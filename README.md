# 优化用jar启动的项目

## 提前解压项目文件，并且创建项目启动需要的logs目录。
这样在docker构建过程中就不需要执行RUN命令，不需要创建一个新的docker image layer，从而能进一步瘦身docker image。
* 首先解压开发交付的打包文件，比如命名为pylon-service-web-biz-2.0-SNAPSHOT-linux.tar.gz
`tar zxf pylon-service-web-biz-2.0-SNAPSHOT-linux.tar.gz`

* 创建logs目录
`mkdir pylon-serivce-web/logs`

* 创建压缩包
`tar zcvf pylon-serivce-web.tar.gz pylon-serivce-web`

## 准备好启动脚本

`#!/bin/sh
/opt/pylon-service-web/bin/pylon-service-web start && until [ -f /opt/pylon-service-web/pylon-web.log ]; do sleep 1;done && tail -f /opt/pylon-service-web/pylon-web.log
`

## 准备Dockerfile

FROM openjdk:8-jdk-latest
ADD ./pylon-service-web.tar.gz /opt
COPY  ./start.sh /opt
WORKDIR /opt
EXPOSE 8013
CMD ["/bin/sh","-c","/opt/start.sh"]




