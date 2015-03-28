# == Class: php5::modules
#
# Install php5 modules
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

class php5::modules {
  contain php5::memcached
  contain php5::mcrypt
  contain php5::mysql
  contain php5::curl
  contain php5::xdebug
}