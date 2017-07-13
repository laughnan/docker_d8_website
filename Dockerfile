FROM centos:6.9

RUN yum update -y

# Install RPM for php 5.6
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum install php56w php56w-mbstring php56w-xml php56w-xmlrpc git -y

# Install Ruby to allow for gems
RUN yum groupinstall -y 'development tools'
RUN curl -L get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
RUN rvm reload
RUN rvm install 2.1.0 
RUN ruby --version

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer