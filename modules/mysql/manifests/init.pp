# == Class: mysql
#
# install mysql
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

class mysql {

  contain mysql::base
  contain mysql::configure

  service { "mysql":
    enable  => true,
    ensure  => running,
    require => [Package['mysql-server'],Package['mysql-server-core']]
  }

  exec { "mysql::restart-service":
    command => "sudo service mysql restart",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require => Service['mysql'],
  }

}
