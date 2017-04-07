FROM nginx:stable

LABEL maintainer="Royee <ms_save95@126.com>"

# nginx config
ADD config/nginx.conf-base  /etc/nginx/nginx.conf

# nginx runtime directory
#   webroot: /usr/share/nginx/html
#   log: /usr/share/nginx/log
#   web site .conf: /etc/nginx/conf.d
#VOLUME ["/usr/share/nginx", "/etc/nginx/conf.d"]

#EXPOSE 80 443