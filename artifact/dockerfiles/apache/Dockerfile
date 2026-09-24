FROM httpd:2.4.57-bookworm

# Install required packages
RUN apt-get update
RUN apt-get install -y php8.2 libapache2-mod-php8.2
RUN cp /usr/lib/apache2/modules/libphp8.2.so /usr/local/apache2/modules/libphp8.2.so
