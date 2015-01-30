#!/bin/bash

echo "INSTALLING RESOURCES FOR OCTAVIUS DEV ENVIRONMENT"
echo "================================================="

sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
sudo apt-get update
sudo apt-get -y install mysql-server-5.5 build-essential libssl-dev git curl nodejs qt4-dev-tools libqt4-dev libqt4-core libqt4-gui libmysqlclient-dev 



echo "SETTING UP MYSQL DEFAULT USER (vagrant:vagrant)" 
if [ ! -f /var/log/databasesetup ];
then
    echo "CREATE USER 'vagrant'@'%' IDENTIFIED BY 'vagrant'" | mysql -u root --password=root
    echo "GRANT ALL ON *.* TO 'vagrant'@'%'" | mysql -u root --password=root
    echo "FLUSH PRIVILEGES" | mysql -u root --password=root

    touch /var/log/databasesetup

    if [ -f /vagrant/data/initial.sql ];
    then
        mysql -uroot -prootpass wordpress < /vagrant/data/initial.sql
    fi
fi

wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2
tar -xvf phantomjs-1.9.8-linux-x86_64.tar.bz2
sudo cp phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/
rm -rf phantomjs-1.9.8-linux-x86_64 phantomjs-1.9.8-linux-x86_64.tar.bz2


echo "INSTALLING RUBY AND RAILS"
# Add trusted GPG key for RVM to work
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# The other scripts will install the rest of Ruby and Rails.. 