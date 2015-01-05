# == Class: apache2::base
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

class apache2::base {

  package{ 'apache2':
    ensure => 'latest'
  }

}
