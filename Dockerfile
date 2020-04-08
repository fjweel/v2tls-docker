FROM alpine:latest
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl
RUN curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v4.23.1/v2ray-linux-64.zip                                             
RUN mkdir /usr/bin/v2ray /etc/v2ray
RUN touch /etc/v2ray/config.json
RUN unzip /v2ray.zip -d /usr/bin/v2ray
RUN rm -rf /v2ray.zip /usr/bin/v2ray/*.sig /usr/bin/v2ray/doc /usr/bin/v2ray/*.json /usr/bin/v2ray/*.dat /usr/bin/v2ray/sys*
RUN chgrp -R 0 /etc/v2ray
RUN chmod -R g+rwX /etc/v2ray
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80
