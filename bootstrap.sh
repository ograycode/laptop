apt-get update
apt-get -y install puppetmaster
wget -nc http://forge.puppetlabs.com/puppetlabs/apt/1.3.0.tar.gz
tar -zxvf 1.3.0.tar.gz
mv puppetlabs-apt-1.3.0 /etc/puppet/modules/apt
wget -nc http://forge.puppetlabs.com/puppetlabs/stdlib/4.1.0.tar.gz
tar -zxvf 4.1.0.tar.gz
mv puppetlabs-stdlib-4.1.0 /etc/puppet/modules/stdlib
cp site.pp /etc/puppet/manifests/site.pp
puppet apply /etc/puppet/manifests/site.pp
rm -r ~/.config/plank/dock1
cp -a files/dock1 ~/.config/plank
