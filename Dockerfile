FROM alpine:latest
LABEL "maintainer"="Piotr Zaniewszki <piotrzan@gmail.com>"

ARG POCKETBASE_VERSION=0.7.2

RUN apk add --no-cache \
    ca-certificates \
    unzip \
    wget \
    zip \
    zlib-dev

ADD https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_linux_amd64.zip /app/pocketbase/pocketbase.zip
RUN unzip /app/pocketbase/pocketbase.zip -d /app/pocketbase
RUN chmod +x /app/pocketbase/pocketbase
RUN rm /app/pocketbase/pocketbase.zip

EXPOSE 8090

CMD [ "/app/pocketbase/pocketbase", "serve", "--http", "0.0.0.0:8090" ]
