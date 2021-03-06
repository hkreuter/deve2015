# == Class: curl::base
#
# install curl
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

class curl::base {

  contain apt-get-update

  package { 'curl':
    ensure  => 'latest',
    require => Exec['apt-get-update::base::update']
  }

}
