FROM nginx
WORKDIR /var/app
COPY . /var/app
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf
#expose
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
