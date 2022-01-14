FROM nginx

ARG WWWUSER=1100
ARG WWWGROUP=1100
WORKDIR /var/www/html

COPY ./nginx.conf /etc/nginx/templates/default.conf.template

RUN mkdir /var/www -p \
    && echo "alias ls='ls -la --color'" >> /var/www/.bashrc \
    && apt update \
    && apt install -y \
        iputils-ping \
    && groupmod -g "$WWWGROUP" www-data \
    && usermod -u "$WWWUSER" www-data \
    && chown -R $WWWUSER:$WWWGROUP \
        /var/cache/nginx/ \
        /etc/nginx/ \
        /var/www/ \
        /run/
