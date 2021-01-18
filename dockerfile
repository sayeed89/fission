FROM centos:7

RUN yum install -y epel-release && yum install -y nginx

WORKDIR /etc/nginx/

COPY index.html /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
