# == Class: php5:base
#
# Install php 5.x, depending on config settings in *.yaml
# See https://launchpad.net/~ondrej/+archive/ubuntu/php5-oldstable
#     https://help.launchpad.net/Packaging/PPA/InstallingSoftware
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

class php5::base {

  package { "php5":
    ensure  => 'latest',
    require => Exec['apt-get-update::base::update']
  }

  package { "php5-dev":
    ensure   => 'latest',
    require  => Exec['apt-get-update::base::update']
  }

}
