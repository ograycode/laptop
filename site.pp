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
  key => '94558F59',
  key_server => 'keyserver.ubuntu.com',
}
->
package {'spotify-client':}

if $lsbdistid == 'elementary OS' {
  apt::ppa {'ppa:versable/elementary-update':}
  ->
  package {'elementary-tweaks':}
  ->
  package {'elementary-plank-themes':}
  ->
  package {'elementary-lion-theme':}
}
