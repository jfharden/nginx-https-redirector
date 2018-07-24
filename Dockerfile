FROM nginx:1.15

RUN rm /etc/nginx/conf.d/default.conf && rm /usr/share/nginx/html/index.html

COPY nginx-conf.d/* /etc/nginx/conf.d/
