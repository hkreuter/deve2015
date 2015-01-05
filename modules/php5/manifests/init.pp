# == Class: php5
#
# Configure php.ini settings for php cli
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

class php5 {

  $directories   = hiera(php::directories)
  $extension_dir = hiera(php::extension_dir)

  file { $directories:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0755
  }

  file { $extension_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0755
  }

  contain php5::base
  contain php5::modules
  contain php5::configure

  Class['sources']        ->
  Class['php5::base']     ->
  Class['php5::modules']  ->
  Class['php5::configure']

}
