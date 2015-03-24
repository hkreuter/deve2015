# == Class: mysql::configure
#
# configure mysql
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

class mysql::configure {

  file { 'mysql::configure::my_cnf':
    ensure  => present,
    path    => '/etc/mysql/my.cnf',
    owner   => 'root',
    group   => 'root',
    mode    => '0775',
    content => template("mysql/my_cnf.erb")
  }

  exec { "set-mysql-password":
    command => "mysqladmin -uroot password root",
    path    => hiera(generic::execpath, '/usr/local/bin/:/bin/:'),
    unless  => "mysqladmin -uroot -proot status",
    require => Class['mysql::base']
  }
}
