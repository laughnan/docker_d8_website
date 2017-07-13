FROM centos:6.9

# update centos
RUN yum update -y

# install rpm for php 5.6
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

# install necessary libraries (includes php, ruby, gems, and git)
RUN yum install php56w php56w-mbstring php56w-xml php56w-xmlrpc git wget -y

# Install Ruby 
RUN wget http://ftp.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz 
RUN tar xvzf ruby-2.1.1.tar.gz
RUN cd ruby-2.1.1
RUN ./configure --prefix=/usr
RUN make
RUN make install

# Install RubyGems 
RUN wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.25.tgz
RUN tar xvzf rubygems-1.8.25.tgz
RUN cd rubygems-1.8.25
RUN ruby setup.rb config
RUN ruby setup.rb setup
RUN ruby setup.rb install

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer