# == Class: apt-get-update::base
#
# run apt-update
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

class apt-get-update::base {

  exec { "apt-get-update::base::update":
    command     => "sudo apt-get update -y",
    path        => hiera(generic::execpath, '/usr/local/bin/:/bin/:')
  }
}
