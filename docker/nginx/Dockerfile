FROM nginx
WORKDIR /var/app
COPY . /var/app
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
