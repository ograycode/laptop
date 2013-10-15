include apt

file {'/etc/hostname':
  ensure => file,
  content => 'monster-island'
}

package {'git':
  ensure => 'latest'
}

package {'openjdk-7-jdk':
  ensure => 'latest'
}

package {'firefox':}
package {'ubuntu-restricted-extras':}

apt::source { 'spotify':
  location => 'http://repository.spotify.com',
  release => 'stable',
  repos => 'non-free',
}
->
exec {'install spotify':
  command => 'sudo apt-get --force-yes -y install spotify-client',
  path => '/usr/bin',
}

apt::source {'steam-repo':
  location => 'http://repo.steampowered.com/steam/',
  release => 'precise',
  repos => 'steam',
}
->
exec {'install steam':
  command => 'sudo apt-get --force-yes -y install steam',
  path => '/usr/bin',
}

apt::ppa {'ppa:webupd8team/sublime-text-3':}
->
package {'sublime-text-installer':}

apt::ppa {'ppa:ehoover/compholio':
  require => Package['msttcorefonts'],
}
->
package {'netflix-desktop':}

exec { "accept-msttcorefonts-license":
  command => "/bin/sh -c \"echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections\""
}

package { "msttcorefonts":
  ensure  => installed,
  require => Exec['accept-msttcorefonts-license']
}

if $lsbdistid == 'elementary OS' {
  apt::ppa {'ppa:versable/elementary-update':}
  ->
  package {'elementary-tweaks':}
  ->
  package {'elementary-plank-themes':}
  ->
  package {'elementary-lion-theme':}
}
