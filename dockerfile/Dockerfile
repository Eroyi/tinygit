FROM alpine:latest
CMD ["/bin/sh"]
MAINTAINER ax@civ.ax
EXPOSE 80
RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories
RUN apk update && apk upgrade && apk add nginx git git-daemon fcgiwrap spawn-fcgi apache2-utils
RUN rm -rf /var/cache/apk/*
VOLUME /git
ADD nginx.conf /etc/nginx/nginx.conf
ADD init.sh /init.sh
RUN chmod +x /init.sh
CMD ["/bin/sh","-c","sh /init.sh bgt"]
