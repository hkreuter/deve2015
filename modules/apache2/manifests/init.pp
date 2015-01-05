# == Class: apache2
#
# puppet module for apache2
#
# === Parameters
#
# === Variables
#
# No variables
#
# === Examples
#
# TODO
#
# === Authors
#
# H.R. (Deve L. Oper)
#
# === Copyright
#
# Copyright 2014-2015 H.R., unless otherwise noted.
#

class apache2 {

  contain apache2::base
  contain apache2::configure
  contain apache2::modules

  service { "apache2":
    enable  => true,
    ensure  => running,
    require => Package['apache2'],
  }

  exec { "apache2::restart":
    command  => "sudo /etc/init.d/apache2 restart",
    path     => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require  => Service['apache2'],
  }

  exec { "apache2::force-reload":
    command => "sudo /etc/init.d/apache2 force-reload",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require => Service['apache2'],
    notify  => Exec['apache2::restart-service']
  }

  exec { "apache2::restart-service":
    command  => "sudo service apache2 restart",
    path     => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require  => Service['apache2'],
  }

}
