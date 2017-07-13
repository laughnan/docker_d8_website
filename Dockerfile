FROM centos:6.9

# update centos
RUN yum update -y

# install rpm for php 5.6
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

# install necessary libraries (includes php, ruby, gems, and git)
RUN yum install php56w php56w-mbstring php56w-xml php56w-xmlrpc git ruby ruby-devel rubygems -y

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer