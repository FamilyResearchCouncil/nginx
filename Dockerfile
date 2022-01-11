FROM nginx

ARG WWWUSER=1100
ARG WWWGROUP=1100

RUN apt update \
    && apt install -y \
    iputils-ping

RUN groupmod -g "$WWWGROUP" www-data \
    && usermod -u "$WWWUSER" www-data \
    && chown "$WWWUSER:$WWWGROUP" -R \
        /var/cache/nginx \
        /var/run


