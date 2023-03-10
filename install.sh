# takes two paramters, the domain name and the email to be associated with the certificate
DOMAIN=$1
EMAIL=$2
 
echo MARIADB_USER=matomo > .env
echo MARIADB_PASSWORD=`openssl rand 30 | base64 -w 0` >> .env
echo MARIADB_ROOT_PASSWORD=`openssl rand 30 | base64 -w 0` >> .env
echo DOMAIN=www.promenkul.org >> .env
echo EMAIL=zafer@zaferkaraca.net >> .env
 
# Phase 1
docker-compose -f ./docker-compose-initiate.yaml up -d nginx
docker-compose -f ./docker-compose-initiate.yaml up certbot
docker-compose -f ./docker-compose-initiate.yaml down
 
# some configurations for let's encrypt
curl -L --create-dirs -o etc/letsencrypt/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf
openssl dhparam -out etc/letsencrypt/ssl-dhparams.pem 2048
 
# Phase 2
crontab ./etc/crontab
docker-compose -f ./docker-compose.yaml -d up