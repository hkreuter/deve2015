# == Class: zendguardloader::base
#
# puppet module for zendguardloader
# NOTE: copy files to zendguardloader/files
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

class zendguardloader::base {

  $basedir  = hiera(zendloader::basedir)
  $filename = hiera(zendloader::filename)

  file { "$basedir":
    ensure  => directory,
    replace => "no",
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => 0775
  }

  file { "$basedir/$filename":
    ensure  => present,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => 0775,
    source  => "puppet:///modules/zendguardloader/$filename"
  }

}