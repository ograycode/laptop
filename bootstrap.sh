#Install git and clone the repo
sudo apt-get update
sudo apt-get -y install git
git clone https://github.com/ograycode/laptop.git
cd laptop/
#Install puppet master and the modules needed
sudo apt-get -y install puppetmaster
wget -nc http://forge.puppetlabs.com/puppetlabs/apt/1.3.0.tar.gz
tar -zxvf 1.3.0.tar.gz
sudo mv puppetlabs-apt-1.3.0 /etc/puppet/modules/apt
wget -nc http://forge.puppetlabs.com/puppetlabs/stdlib/4.1.0.tar.gz
tar -zxvf 4.1.0.tar.gz
sudo mv puppetlabs-stdlib-4.1.0 /etc/puppet/modules/stdlib
#copy the puppet manifest and apply it
sudo cp site.pp /etc/puppet/manifests/site.pp
sudo puppet apply /etc/puppet/manifests/site.pp
#prepare the dock/plank
sudo rm -r ~/.config/plank/dock1
sudo cp -a files/dock1 ~/.config/plank
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/ARTcast.jpg
