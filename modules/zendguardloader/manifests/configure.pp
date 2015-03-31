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

  $zlpath   = hiera(zendloader::lib_dir)
  $zlname   = hiera(zendloader::inifilename, 'ZendGuardLoader.ini')
  $phpconfd = hiera(zendloader::phpconfdir)
  $linkto   = hiera(zendloader::inilinkto)

  file { 'zendguardloader::configure::zendloader_ini':
    ensure  => present,
    path    => "$zlpath/$zlname",
    owner   => 'root',
    group   => 'root',
    mode    => '0775',
    content => template("zendguardloader/ZendGuardLoader.ini.erb")
  }

  exec { 'zendguardloader::configure::confd_link':
    command  => "sudo ln -sf $zlpath/$zlname $phpconfd/$linkto",
    path     => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    require  => [Package['php5'],File['zendguardloader::configure::zendloader_ini']]
  }

}
