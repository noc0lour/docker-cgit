FROM alpine:3.5

RUN \
    apk add --no-cache \
    dumb-init \
    git \
    cgit \
    spawn-fcgi \
    fcgiwrap \
    nginx && \
    mkdir -p /run/nginx

COPY cgitrc /etc/cgitrc
COPY nginx.conf /etc/nginx/nginx.conf
COPY start_nginx.sh start_nginx.sh

VOLUME /git

ENTRYPOINT ["dumb-init"]

CMD ["./start_nginx.sh"]
