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

  #contain pear
  contain sources::apache2php

#  Class['apt-get-install'] ->
#  Class['sources']         ->
#  Class['apt-get-update']

}