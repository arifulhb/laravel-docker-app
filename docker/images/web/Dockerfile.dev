FROM nginx:1.19.4

CMD ["nginx"]

# Work Directory
WORKDIR /var/www/app

COPY ./docker/images/web/conf.d /etc/nginx/conf.d
COPY ./docker/images/web/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/images/web/sites/default.dev.conf /etc/nginx/sites-available/default.conf


EXPOSE 80 443
