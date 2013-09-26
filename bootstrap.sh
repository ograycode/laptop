apt-get update
apt-get -y install puppetmaster
wget -nc http://forge.puppetlabs.com/puppetlabs/apt/1.3.0.tar.gz
tar -zxvf 1.3.0.tar.gz
mv 1.3.0 /etc/puppet/modules/apt
wget -nc http://forge.puppetlabs.com/puppetlabs/stdlib/4.1.0.tar.gz
tar -zxvf 4.1.0.tar.gz
mv 4.1.0 /etc/puppet/modules/stdlib
mv site.pp /etc/puppet/manifests/site.pp
puppet apply /etc/puppet/manifests/site.pp
