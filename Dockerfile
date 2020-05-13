FROM alpine:latest
RUN apk add --no-cache --virtual .build-deps ca-certificates curl
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
EXPOSE 80
ENTRYPOINT ["/configure.sh"]
