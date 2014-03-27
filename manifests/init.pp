class composer::install {

  exec { 'php-install-composer':
    cwd     => "/home/vagrant",
    command => '/usr/bin/curl -s https://getcomposer.org/installer | php',
    timeout => 0,
    creates => "/home/vagrant/composer.phar",
    require => Class['php::install'],
  }


  file { '/usr/bin/composer':
    ensure  => link,
    target  => "/home/vagrant/composer.phar",
    require => Exec['php-install-composer'],
  }
}

class composer::configure {
}

class composer {
    include composer::install
    include composer::configure
}