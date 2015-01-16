# == Class: git::base
#
# install git
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

class git::base {

  package { 'git':
    ensure  => 'latest',
    require => Exec['apt-get-update::base::update']
  }

}
