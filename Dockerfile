FROM nginx

ARG WWWUSER=1100
ARG WWWGROUP=1100

RUN echo "$WWWUSER:$WWWGROUP"

RUN apt update \
    && apt install -y \
    iputils-ping

RUN groupmod -g "$WWWGROUP" www-data \
    && usermod -u "$WWWUSER" www-data \
    && chown -R $WWWUSER:$WWWGROUP\
        /var/cache/nginx \
        /var/run


USER www-data
