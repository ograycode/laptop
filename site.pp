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

package {'elementary-tweaks':}

package {'elementary-plank-themes':}

package {'elementary-lion-theme':}
