FROM alpine:latest

RUN apk add --no-cache stunnel
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
