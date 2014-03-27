class composer::install {

  exec { 'php-install-composer':
    cwd     => "/opt/phpfarm/inst/current-bin",
    command => 'curl -s https://getcomposer.org/installer | php',
    timeout => 0,
    creates => "/opt/phpfarm/inst/current-bin/composer.phar",
    require => Class['php::install'],
  }


  file { '/usr/bin/composer':
    ensure  => link,
    target  => "/opt/phpfarm/inst/current-bin/composer.phar",
    require => Exec['php-install-composer'],
  }
}

class composer::configure {
}

class composer {
    include composer::install
    include composer::configure
}