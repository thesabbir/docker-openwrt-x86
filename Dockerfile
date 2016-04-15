## -*- docker-image-name: "thesabbir/openwrt-x86" -*-

FROM scratch
MAINTAINER Sabbir Ahmed <mail@thesabbir.com>

CMD ["/bin/ash"]

ADD image/openwrt-x86-rootfs.tar.gz /
ADD image/root /

RUN echo "4" > /tmp/debug_level &&\
    rm /lib/preinit/* &&\
    echo > /lib/preinit/00_empty_dummy_script &&\
    /etc/init.d/cron disable &&\
    /etc/init.d/led disable &&\
    /etc/init.d/network disable &&\
    /etc/init.d/odhcpd disable &&\
    /etc/init.d/sysctl disable &&\
    /etc/init.d/sysfixtime disable &&\
    /etc/init.d/sysntpd disable &&\
    /etc/init.d/telnet disable
