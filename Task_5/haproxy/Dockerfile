FROM haproxytech/haproxy-alpine:2.4

#copy haproxy config and certificate to default location on container
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY ashiko.pem /etc/ssl/certs/ashiko.pem

#exposing port
EXPOSE 80
