# == Class: sources
#
# install sources
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

class sources {

  contain sources::apache2php
  contain sources::pear

  Class['apt-get-install'] ->
  Class['sources']         ->
  Class['apt-get-update']

}