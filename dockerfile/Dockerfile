FROM alpine:latest
MAINTAINER ax@civ.ax
EXPOSE 80
ADD init.sh /init.sh
RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
    && apk --no-cache --virtual build-dependencies add nginx git git-daemon fcgiwrap spawn-fcgi apache2-utils \
    && chmod +X /init.sh
VOLUME /git
ADD nginx.conf /etc/nginx/nginx.conf
CMD ["/bin/sh","-c","sh /init.sh"]
