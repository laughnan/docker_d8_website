FROM centos:6.9

RUN sudo yum update

# Install RPM for php 5.6
RUN sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN sudo rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN sudo yum install php56w

RUN curl -sS https://getcomposer.org/installer | php
RUN sudo mv composer.phar /usr/local/bin/composer