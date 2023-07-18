openssl req -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -subj "/C=UA/ST=UA/O=Spirling/CN=*.spirling.loc" \
    -keyout ../config/nginx/ssl/nginx-selfsigned.key \
    -out ../config/nginx/ssl/nginx-selfsigned.crt

openssl dhparam -out ../config/nginx/ssl/dhparam.pem 4096