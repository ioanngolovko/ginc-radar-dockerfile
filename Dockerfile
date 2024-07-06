FROM debian:12.4

ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
    && apt install -y \
        ca-certificates \
        curl

RUN install -m 0755 -d /etc/apt/keyrings

RUN curl -fsSL https://download.ginc-it.ru/linux/debian/gpg.asc -o /etc/apt/keyrings/ginc-it.asc
RUN echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/ginc-it.asc] https://download.ginc-it.ru/linux/debian \
      $(. /etc/os-release && echo "$VERSION_CODENAME") main" | \
      tee /etc/apt/sources.list.d/ginc-it.list > /dev/null

RUN apt update \
    && apt install -y \
        ginc-radar

EXPOSE 80

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

ENV EXTERNAL_URL=http://localhost:80