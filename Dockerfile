FROM nginx

RUN apt update \
    && apt install -y \
    iputils-ping
