FROM armhf/alpine

COPY entrypoint.sh /entrypoint.sh

RUN apk add --update \
		socat && \ 
		rm -rf /var/cache/apk/*
  
  ENTRYPOINT ["/bin/sh","/entrypoint.sh"]
