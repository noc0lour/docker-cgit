FROM alpine:3.5

RUN \
    apk add --no-cache \
    dumb-init \
    git \
    cgit \
    lighttpd

ADD cgit.conf /etc/lighttpd/cgit.conf
ADD cgitrc /etc/cgitrc

RUN echo 'include "cgit.conf"' >> /etc/lighttpd/lighttpd.conf

VOLUME /git

ENTRYPOINT ["dumb-init"]

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
