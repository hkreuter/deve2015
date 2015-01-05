# == Class: apt-get-install
#
# run apt-get install [whatever you want installed]
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

class apt-get-install {
  contain apt-get-install::base
}
