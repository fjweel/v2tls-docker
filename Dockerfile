FROM alpine:latest
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80
