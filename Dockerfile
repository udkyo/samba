FROM alpine

RUN apk update \
    && apk add samba samba-common-tools

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 \
    && chmod +x /usr/local/bin/dumb-init
    
COPY samba.conf /etc/samba/smb.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["dumb-init", "--"]
CMD ["/entrypoint.sh"]