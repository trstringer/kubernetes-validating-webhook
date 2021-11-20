FROM ubuntu:focal
WORKDIR /opt
COPY ./bin/validating-webhook .
CMD ["./validating-webhook", "--tls-cert", "/etc/opt/tls.crt", "--tls-key", "/etc/opt/tls.key"]
