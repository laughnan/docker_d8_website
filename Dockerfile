FROM centos:7

# update centos
RUN yum update -y

# install rpm for php 5.6
RUN http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# install necessary libraries (includes php, ruby, gems, and git)
RUN yum install php56w php56w-mbstring php56w-xml php56w-xmlrpc git ruby ruby-devel rubygems -y

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer