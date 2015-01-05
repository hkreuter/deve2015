# == Class: phpmyadmin::base
#
# install phpmyadmin
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

class phpmyadmin::base {

  package { 'phpmyadmin':
    ensure  => latest,
    require => Package['apache2'],
    notify  => Service['apache2']
  }

}
