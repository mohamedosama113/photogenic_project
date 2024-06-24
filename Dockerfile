# Use the official centos/httpd image as base
FROM centos/httpd

# Set the maintainer label
LABEL project=photogenic
####
# Copy website files to the Apache document root
RUN yum install -y wget && wget https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip
ADD /home/ubuntu/photogenic.zip /var/www/html/
WORKDIR /var/www/html
RUN yum install -y unzip && unzip photogenic.zip && rm photogenic.zip
# Expose port 80
EXPOSE 80

# Start Apache server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

