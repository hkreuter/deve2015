# == Class: mysql::base
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

class mysql::base {

  package { 'mysql-client-core-5.5':
    ensure  => latest
  }

  package { 'mysql-common':
    ensure  => latest
  }

  package { 'mysql-server-core':
    ensure  => latest
  }

  package { 'mysql-server':
    ensure  => latest,
    require => [Package['mysql-common'],Package['mysql-server-core']]
  }

}
