FROM alpine:latest
MAINTAINER Jan Sanchez <joejansanchez@gmail.com>

COPY ./run.sh /tmp/run.sh
ENV HUGO_VERSION=0.30.2
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz /tmp
RUN tar -xf /tmp/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/hugo_${HUGO_VERSION}_linux_amd64

RUN apk update \
    && apk upgrade \
    && apk add --no-cache ca-certificates

RUN mkdir -p /tmp/ \
    && chmod 755 -R /tmp/
RUN mkdir -p /tmp/source \
    && mkdir -p /tmp/output
RUN chmod 755 -R /tmp/source \
    && chmod 755 -R /tmp/output \
    && chmod 755 -R /tmp/run.sh

VOLUME /tmp/source
VOLUME /tmp/output

WORKDIR /tmp/source
CMD ["/tmp/run.sh"]

EXPOSE 1313

# Forked from https://github.com/jojomi/docker-hugo
