FROM openjdk:8-jdk-latest

ADD ./pylon-service-web.tar.gz /opt
COPY  ./start.sh /opt

WORKDIR /opt


EXPOSE 8013

CMD ["/bin/sh","-c","/opt/start.sh"]
