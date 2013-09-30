#Install git and clone the repo
echo "Updating apt-get.."
sudo apt-get update

echo "---------------------------------------------------------"
echo "Installing git..."
echo "---------------------------------------------------------"
sudo apt-get -y install git

#clone the repo
echo "---------------------------------------------------------"
echo "Cloning the repo..."
git clone https://github.com/ograycode/laptop.git
cd laptop/

#prepare the dock/plank
echo "---------------------------------------------------------"
echo "Setting up plank..."
echo "---------------------------------------------------------"
sudo rm -r ~/.config/plank/dock1
sudo cp -a files/dock1 ~/.config/plank

#Install puppet master and the modules needed
echo "---------------------------------------------------------"
echo "Installing puppet and the needed modules..."
echo "---------------------------------------------------------"
sudo apt-get -y install puppetmaster
wget -nc http://forge.puppetlabs.com/puppetlabs/apt/1.3.0.tar.gz
tar -zxvf 1.3.0.tar.gz
sudo mv puppetlabs-apt-1.3.0 /etc/puppet/modules/apt
wget -nc http://forge.puppetlabs.com/puppetlabs/stdlib/4.1.0.tar.gz
tar -zxvf 4.1.0.tar.gz
sudo mv puppetlabs-stdlib-4.1.0 /etc/puppet/modules/stdlib

#copy the puppet manifest and apply it
echo "---------------------------------------------------------"
echo "Applying the puppet manifest..."
echo "---------------------------------------------------------"
sudo cp site.pp /etc/puppet/manifests/site.pp
sudo puppet apply /etc/puppet/manifests/site.pp

echo "---------------------------------------------------------"
echo "Setting the wallpaper..."
echo "---------------------------------------------------------"
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/ARTcast.jpg

echo "---------------------------------------------------------"
echo "Done, please reboot to apply all changes."
echo "---------------------------------------------------------"
