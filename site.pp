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

if $lsbdistid == 'elementary OS' {
  apt::ppa {'ppa:versable/elementary-update':}
  ->
  package {'elementary-tweaks':}
  ->
  package {'elementary-plank-themes':}
  ->
  package {'elementary-lion-theme':}
}
