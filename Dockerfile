FROM centos/httpd:latest
#RUN yum -y install httpd && yum clean all && systemctl enable httpd.service
#EXPOSE 80
COPY . /var/www/html/
#CMD ["/usr/sbin/init"]
