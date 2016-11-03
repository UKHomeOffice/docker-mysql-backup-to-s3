FROM alpine:3.4

RUN apk add --no-cache mysql-client

RUN mkdir -p /aws && \
	  apk -Uuv add groff less python py-pip && \
	  pip install awscli && \
	  apk --purge -v del py-pip && \
	  rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
