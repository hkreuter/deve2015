# == Class: zendguardloader::configure
#
# puppet module for zendguardloader
# configure ini file
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

class zendguardloader::configure {

  $path = hiera(zendloader::lib_dir)

  file { 'zendguardloader::configure::zendloader_ini':
    ensure  => present,
    path    => "$path/ZendGuardLoader.ini",
    owner   => 'root',
    group   => 'root',
    mode    => '0775',
    content => template("zendguardloader/ZendGuardLoader.ini.erb")
  }

}
