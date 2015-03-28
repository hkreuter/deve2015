# == Class: xdebug::base
#
# Install php5 module xdebug
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

class xdebug::base {

  package { 'xdebug':
    name    => 'php5-xdebug',
    ensure  => installed,
    require => [Package['php5'],Package['php5-dev']]
  }

}
