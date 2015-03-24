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
    ensure  => latest,
    require => Class['apt-get-update::base']
  }

  package { 'mysql-common':
    ensure  => latest,
    require => Class['apt-get-update::base']
  }

  package { 'mysql-server-core':
    ensure  => latest,
    require => Class['apt-get-update::base']
  }

  package { 'mysql-server':
    ensure  => latest,
    require => [Class['apt-get-update::base'],Package['mysql-common'],Package['mysql-server-core']]
  }

}
