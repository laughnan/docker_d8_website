FROM centos:7

# update centos
RUN yum update -y

# install rpm for php 5.6
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# install necessary libraries (includes php, ruby, gems, and git)
RUN yum install php56w php56w-mbstring php56w-xml php56w-xmlrpc php56w-gd php56w-pdo git centos-release-scl-rh centos-release-scl -y

# requirements for rvm
RUN yum install gcc-c++ patch readline readline-devel zlib zlib-devel -y
RUN yum install libyaml-devel libffi-devel openssl-devel make -y
RUN yum install bzip2 autoconf automake libtool bison iconv-devel sqlite-devel -y

# get rvm to install
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -L get.rvm.io | bash -s stable

# install the correct versions and details for ruby 2.2+
RUN source /etc/profile.d/rvm.sh
RUN rvm reload
RUN rvm requirements run
RUN rvm install 2.2.4
RUN rvm use 2.2.4 --default
RUN ruby --version
RUN rvm rubygems current

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer