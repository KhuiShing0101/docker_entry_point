FROM alpine:latest

#install nginx
RUN apk update && \
    apk add nginx \
    rm -rf /var/cache/apk/*

#copy nginx config
COPY nginx.conf /etc/nginx/http.d/default.conf

#create directory for the website 
RUN mkdir -p /var/www/html

#copy the website
COPY index.html /var/www/html/index.html

#change ownership of the website
RUN chown -R nginx:nginx /var/www/html

#Expose port 80
EXPOSE 80

#Start Nginx in the foreground when the container starts
CMD ["nginx", "-g", "daemon off;"]