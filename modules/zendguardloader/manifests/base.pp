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
/*
  file { "$basedir/$filename":
    ensure  => present,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => 0775,
    source  => "puppet:///modules/zendguardloader/$filename"
  }
*/
  #php-config --extension-dir

  #zendloader::file: "ZendGuardLoader_php5_4.so"

#  zendloader::lib_dir: ""
#zendloader::enable: "1"
#zendloader::disable_licensing: "0"
#zendloader::obfuscation_level_support: "3"
#zendloader::license_path: ""

  #file { 'php5::configure::php_ini':
  #  ensure  => present,
  #  path    => '/etc/php5/cli/php.ini',
  #  owner   => 'root',
  #  group   => 'root',
  #  mode    => '0775',
  #  content => template("php5/php_ini.erb")
  #}




}


/*
file { '/etc/apache2/ports.conf':
  ensure  => present,
  owner   => root,
  group   => root,
  mode    => 0775,
  source  => "puppet:///modules/apache2/default_ports.conf",
  require => File[$directories]
} */