FROM alpine:3.5
RUN apk --no-cache add xvfb openbox xllvnc xfce4-terminal supervisor sudo \
&& addgroup alpine \
&& adduser  -G alpine -s /bin/sh -D alpine \
&& echo "alpine:alpine" | /usr/sbin/chpasswd \
&& echo "alpine    ALL=(ALL) ALL" >> /etc/sudoers \
&& rm -rf /apk /tmp/* /var/cache/apk/*
ADD etc /etc
WORKDIR /home/alpine
EXPOSE 5900
USER alpine
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
